# SwiftUI Development Guidelines

**ContextKit**: SwiftUI architectural patterns, MVVM conventions, Combine integration, state management approaches, navigation patterns, and UI development standards for consistent app structure.

**Prerequisites**: Read [Swift.md](Swift.md) first for language fundamentals and constitutional principles.

## Constitutional Principles for SwiftUI

All SwiftUI development must uphold these non-negotiable principles from [ContextKit/Constitution.md](../Constitution.md):

### 1. Accessibility-First Design
- Every SwiftUI view must include proper accessibility labels and hints
- Support for Dynamic Type and VoiceOver navigation
- Color contrast compliance and alternative text for visual elements
- Keyboard navigation support for all interactive elements

### 2. Localizability from Day One
- All user-facing strings use semantic localization keys
- Region-appropriate formatters for dates, numbers, and currencies
- Right-to-left (RTL) language support considerations
- Cultural adaptation beyond text translation

### 3. Privacy by Design
- Data collection transparency and minimal data principles
- User consent flows for sensitive permissions
- Local-first data storage with explicit cloud sync consent
- Privacy manifest compliance for all data usage

### 4. Platform-Appropriate UX
- Strict adherence to Apple Human Interface Guidelines
- Platform-specific navigation patterns (iOS vs macOS)
- Proper use of system colors, typography, and spacing
- Respect for user preferences and system settings

## SwiftUI Architecture Patterns

### MVVM with SwiftUI

Follow a clear Model-View-ViewModel pattern optimized for SwiftUI:

```swift
// MARK: - Model (Pure Swift, no UI dependencies)
struct User: Identifiable, Codable {
   let id = UUID()
   let name: String
   let email: String
   
   // Business logic belongs in models
   var isValidEmail: Bool {
      email.contains("@") && email.contains(".")
   }
}

// MARK: - ViewModel (@Observable for iOS 17+)
@Observable
final class UserViewModel {
   private let userService: UserService
   
   // Published state
   var users: [User] = []
   var isLoading = false
   var errorMessage: String?
   
   init(userService: UserService = UserService()) {
      self.userService = userService
   }
   
   // Intent-based methods (not direct state manipulation)
   @MainActor
   func loadUsers() async {
      isLoading = true
      errorMessage = nil
      
      do {
         users = try await userService.fetchUsers()
      } catch {
         errorMessage = error.localizedDescription
      }
      
      isLoading = false
   }
}

// MARK: - View (SwiftUI)
struct UserListView: View {
   @State private var viewModel = UserViewModel()
   
   var body: some View {
      NavigationView {
         Group {
            if viewModel.isLoading {
               ProgressView("Loading users...")
                  .accessibilityLabel("Loading user list")
            } else {
               List(viewModel.users) { user in
                  UserRowView(user: user)
               }
               .accessibilityLabel("User list")
            }
         }
         .navigationTitle("Users")
         .task {
            await viewModel.loadUsers()
         }
         .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("OK") {
               viewModel.errorMessage = nil
            }
         } message: {
            if let errorMessage = viewModel.errorMessage {
               Text(errorMessage)
            }
         }
      }
   }
}
```

### State Management Hierarchy

Follow this hierarchy for state management decisions:

1. **`@State`** - Local view state (toggles, text input, selection)
2. **`@Observable`** - Shared state across view hierarchy (iOS 17+)
3. **`@StateObject`/`@ObservableObject`** - Legacy reactive state (iOS 16-)
4. **Environment values** - App-wide configuration and services
5. **SwiftData** - Persistent data with automatic UI updates

```swift
// Local state example
struct ToggleView: View {
   @State private var isEnabled = false
   
   var body: some View {
      Toggle("Enable Feature", isOn: $isEnabled)
   }
}

// Shared state example  
@Observable
final class AppSettings {
   var theme: Theme = .system
   var notificationsEnabled = true
}

struct SettingsView: View {
   @Environment(AppSettings.self) private var settings
   
   var body: some View {
      Form {
         Picker("Theme", selection: $settings.theme) {
            ForEach(Theme.allCases) { theme in
               Text(theme.displayName).tag(theme)
            }
         }
      }
   }
}
```

## Navigation Patterns

### iOS Navigation Stack (iOS 16+)

Use NavigationStack for hierarchical navigation:

```swift
struct ContentView: View {
   @State private var navigationPath = NavigationPath()
   
   var body: some View {
      NavigationStack(path: $navigationPath) {
         HomeView()
            .navigationDestination(for: User.self) { user in
               UserDetailView(user: user)
            }
            .navigationDestination(for: Settings.self) { _ in
               SettingsView()
            }
      }
   }
}

struct HomeView: View {
   var body: some View {
      List {
         NavigationLink("Profile", value: User.current)
         NavigationLink("Settings", value: Settings())
      }
      .navigationTitle("Home")
   }
}
```

### macOS Navigation Split View

For macOS apps, use NavigationSplitView:

```swift
struct MacOSMainView: View {
   @State private var selectedSidebar: SidebarItem?
   @State private var selectedDetail: DetailItem?
   
   var body: some View {
      NavigationSplitView {
         SidebarView(selection: $selectedSidebar)
      } content: {
         if let selectedSidebar {
            ContentView(item: selectedSidebar, selection: $selectedDetail)
         }
      } detail: {
         if let selectedDetail {
            DetailView(item: selectedDetail)
         } else {
            Text("Select an item")
               .foregroundStyle(.secondary)
         }
      }
   }
}
```

### Modal Presentation

Use sheet and fullScreenCover appropriately:

```swift
struct PresentingView: View {
   @State private var showingSheet = false
   @State private var showingFullScreen = false
   
   var body: some View {
      VStack {
         Button("Show Sheet") {
            showingSheet = true
         }
         .sheet(isPresented: $showingSheet) {
            SheetView()
               .presentationDetents([.medium, .large])
               .presentationDragIndicator(.visible)
         }
         
         Button("Show Full Screen") {
            showingFullScreen = true
         }
         .fullScreenCover(isPresented: $showingFullScreen) {
            FullScreenView()
         }
      }
   }
}
```

## Data Flow and Binding

### Binding Patterns

Use proper binding patterns for data flow:

```swift
// Parent manages state, child receives binding
struct ParentView: View {
   @State private var username = ""
   
   var body: some View {
      VStack {
         UsernameField(username: $username)
         Text("Hello, \(username)")
      }
   }
}

struct UsernameField: View {
   @Binding var username: String
   
   var body: some View {
      TextField("Username", text: $username)
         .textFieldStyle(.roundedBorder)
         .accessibilityLabel("Username input")
   }
}
```

### Environment for Dependency Injection

Use Environment for dependency injection:

```swift
// Define environment key
private struct UserServiceKey: EnvironmentKey {
   static let defaultValue = UserService()
}

extension EnvironmentValues {
   var userService: UserService {
      get { self[UserServiceKey.self] }
      set { self[UserServiceKey.self] = newValue }
   }
}

// Provide at app level
@main
struct MyApp: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
            .environment(\.userService, UserService())
      }
   }
}

// Consume in views
struct SomeView: View {
   @Environment(\.userService) private var userService
   
   var body: some View {
      // Use userService
   }
}
```

## View Composition and Reusability

### View Breakdown Principles

Break down complex views into focused, reusable components:

```swift
// ❌ Monolithic view
struct UserProfileView: View {
   let user: User
   
   var body: some View {
      ScrollView {
         VStack {
            // 50+ lines of UI code...
         }
      }
   }
}

// ✅ Composed view
struct UserProfileView: View {
   let user: User
   
   var body: some View {
      ScrollView {
         VStack(spacing: 16) {
            UserAvatarSection(user: user)
            UserInfoSection(user: user)
            UserStatsSection(user: user)
            UserActionsSection(user: user)
         }
         .padding()
      }
   }
}

// Individual focused components
struct UserAvatarSection: View {
   let user: User
   
   var body: some View {
      AsyncImage(url: user.avatarURL) { image in
         image
            .resizable()
            .aspectRatio(contentMode: .fill)
      } placeholder: {
         Circle()
            .fill(.gray)
      }
      .frame(width: 80, height: 80)
      .clipShape(Circle())
      .accessibilityLabel("Profile picture for \(user.name)")
   }
}
```

### ViewModifier Patterns

Create reusable modifiers for consistent styling:

```swift
// Custom view modifier
struct CardStyle: ViewModifier {
   func body(content: Content) -> some View {
      content
         .padding()
         .background(.regularMaterial)
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .shadow(radius: 1)
   }
}

extension View {
   func cardStyle() -> some View {
      modifier(CardStyle())
   }
}

// Usage
struct SomeView: View {
   var body: some View {
      VStack {
         Text("Card content")
      }
      .cardStyle()
   }
}
```

## Error Handling and User Feedback

### Error States with ErrorKit Integration

Integrate with ErrorKit for typed error handling:

```swift
import ErrorKit

enum UserError: Error, LocalizedError, Throwable {
   case networkUnavailable
   case userNotFound
   case invalidCredentials
   
   var errorDescription: String? {
      switch self {
      case .networkUnavailable:
         return "Network connection unavailable"
      case .userNotFound:
         return "User not found"
      case .invalidCredentials:
         return "Invalid username or password"
      }
   }
   
   var userFriendlyMessage: String {
      switch self {
      case .networkUnavailable:
         return "Please check your internet connection and try again."
      case .userNotFound:
         return "We couldn't find an account with that information."
      case .invalidCredentials:
         return "Please check your username and password."
      }
   }
}

struct UserLoginView: View {
   @State private var username = ""
   @State private var password = ""
   @State private var error: UserError?
   @State private var isLoading = false
   
   var body: some View {
      VStack {
         TextField("Username", text: $username)
         SecureField("Password", text: $password)
         
         Button("Login") {
            Task {
               await performLogin()
            }
         }
         .disabled(isLoading)
         
         if isLoading {
            ProgressView()
               .accessibilityLabel("Signing in")
         }
      }
      .alert("Login Error", isPresented: .constant(error != nil)) {
         Button("OK") {
            error = nil
         }
         Button("Retry") {
            Task {
               await performLogin()
            }
         }
      } message: {
         if let error {
            Text(error.userFriendlyMessage)
         }
      }
   }
   
   private func performLogin() async {
      isLoading = true
      
      do {
         try await AuthService.login(username: username, password: password)
      } catch let userError as UserError {
         error = userError
      } catch {
         error = .networkUnavailable
      }
      
      isLoading = false
   }
}
```

## Performance and Optimization

### View Performance Best Practices

```swift
// ✅ Use @State for simple local state
struct PerformantView: View {
   @State private var count = 0
   
   var body: some View {
      // Body recalculated only when count changes
      VStack {
         Text("\(count)")
            .font(.largeTitle)
         
         Button("Increment") {
            count += 1
         }
      }
   }
}

// ✅ Extract expensive computations
struct ExpensiveComputationView: View {
   let data: [String]
   
   // Computed only when data changes
   private var processedData: [ProcessedItem] {
      data.map { ProcessedItem($0) }
   }
   
   var body: some View {
      List(processedData, id: \.id) { item in
         ItemRow(item: item)
      }
   }
}

// ✅ Use @ViewBuilder for conditional views
struct ConditionalView: View {
   let isLoading: Bool
   
   var body: some View {
      contentView
   }
   
   @ViewBuilder
   private var contentView: some View {
      if isLoading {
         ProgressView()
      } else {
         ContentView()
      }
   }
}
```

### List Performance

Optimize lists for large datasets:

```swift
struct PerformantListView: View {
   let items: [Item]
   
   var body: some View {
      List {
         // Use LazyVStack for complex layouts
         LazyVStack {
            ForEach(items) { item in
               ItemRow(item: item)
                  .listRowSeparator(.hidden)
            }
         }
      }
      .listStyle(.plain)
   }
}

// Optimize row views
struct ItemRow: View {
   let item: Item
   
   var body: some View {
      HStack {
         // Avoid expensive operations in view builders
         AsyncImage(url: item.imageURL) { image in
            image
               .resizable()
               .aspectRatio(contentMode: .fit)
         } placeholder: {
            RectangleFrame()
         }
         .frame(width: 50, height: 50)
         
         VStack(alignment: .leading) {
            Text(item.title)
               .font(.headline)
            Text(item.subtitle)
               .font(.caption)
               .foregroundStyle(.secondary)
         }
         
         Spacer()
      }
      .padding(.vertical, 4)
   }
}
```

## Accessibility Implementation

### VoiceOver Support

```swift
struct AccessibleView: View {
   @State private var progress: Double = 0.5
   
   var body: some View {
      VStack {
         ProgressView(value: progress, total: 1.0)
            .accessibilityLabel("Upload progress")
            .accessibilityValue("\(Int(progress * 100)) percent complete")
         
         Button("Increase Progress") {
            progress = min(1.0, progress + 0.1)
         }
         .accessibilityHint("Increases upload progress by 10 percent")
         
         Image("logo")
            .accessibilityLabel("Company logo")
            .accessibilityHidden(false)
      }
      .accessibilityElement(children: .contain)
   }
}
```

### Dynamic Type Support

```swift
struct DynamicTypeView: View {
   var body: some View {
      VStack(alignment: .leading, spacing: 8) {
         Text("Headline")
            .font(.headline)
            .minimumScaleFactor(0.5)
            .lineLimit(2)
         
         Text("Body text that adapts to user's preferred text size")
            .font(.body)
         
         Button("Action") {
            // Action
         }
         .font(.callout)
         .frame(minHeight: 44) // Minimum touch target
      }
      .padding()
   }
}
```

## Localization Integration

### String Localization with Semantic Keys

```swift
// ✅ Use semantic keys instead of literal text
struct LocalizedView: View {
   var body: some View {
      VStack {
         Text("user.profile.welcome.title")
            .font(.title)
         
         Text("user.profile.welcome.subtitle")
            .font(.body)
            .foregroundStyle(.secondary)
         
         Button("user.profile.edit.action") {
            // Edit profile
         }
      }
   }
}

// For pluralization
struct ItemCountView: View {
   let count: Int
   
   var body: some View {
      Text("item.count.plural \(count)")
         .accessibilityLabel("items.count.accessibility \(count)")
   }
}
```

### Region-Appropriate Formatting

```swift
struct FormattedDataView: View {
   let date: Date
   let price: Decimal
   let number: Double
   
   var body: some View {
      VStack(alignment: .leading) {
         Text(date, style: .date)
            .accessibilityLabel("date.created.accessibility \(date.formatted())")
         
         Text(price, format: .currency(code: "USD"))
            .accessibilityLabel("price.amount.accessibility \(price)")
         
         Text(number, format: .number)
            .accessibilityLabel("statistics.value.accessibility \(number)")
      }
   }
}
```

## Dark Mode and Appearance

### Adaptive Colors and Styling

```swift
struct ThemedView: View {
   var body: some View {
      VStack {
         Text("Adaptive content")
            .foregroundStyle(.primary) // Adapts to light/dark
         
         RoundedRectangle(cornerRadius: 8)
            .fill(.regularMaterial) // Adaptive material
            .frame(height: 100)
         
         Button("Action") {
            // Action
         }
         .buttonStyle(.borderedProminent)
         .tint(.accentColor) // Uses app accent color
      }
      .background(.systemBackground) // Adaptive background
   }
}

// Custom adaptive colors
extension Color {
   static let customPrimary = Color("CustomPrimary") // Asset catalog color
   
   static let adaptiveBlue = Color(
      light: Color.blue,
      dark: Color.cyan
   )
}

extension Color {
   init(light: Color, dark: Color) {
      self.init(UIColor { traitCollection in
         switch traitCollection.userInterfaceStyle {
         case .dark:
            return UIColor(dark)
         default:
            return UIColor(light)
         }
      })
   }
}
```

## Testing SwiftUI Views

### View Testing Patterns

```swift
import XCTest
import SwiftUI
@testable import MyApp

final class UserListViewTests: XCTestCase {
   
   func testUserListDisplaysUsers() {
      // Given
      let users = [
         User(name: "John Doe", email: "john@example.com"),
         User(name: "Jane Smith", email: "jane@example.com")
      ]
      let viewModel = UserViewModel()
      viewModel.users = users
      
      // When
      let view = UserListView()
         .environment(viewModel)
      
      // Then - Use ViewInspector or similar testing framework
      // Verify users are displayed correctly
   }
   
   func testLoadingStateDisplaysProgressView() {
      // Given
      let viewModel = UserViewModel()
      viewModel.isLoading = true
      
      // When
      let view = UserListView()
         .environment(viewModel)
      
      // Then - Verify ProgressView is shown
   }
}

// Accessibility testing
extension UserListViewTests {
   func testAccessibilityLabels() {
      let view = UserListView()
      
      // Verify all interactive elements have accessibility labels
      // Test VoiceOver navigation
      // Verify accessibility hints are appropriate
   }
}
```

## Code Organization

### File Structure for SwiftUI Projects

```
Sources/
├── App/
│   ├── MyApp.swift              # App entry point
│   └── ContentView.swift        # Root view
├── Views/
│   ├── User/
│   │   ├── UserListView.swift
│   │   ├── UserDetailView.swift
│   │   └── Components/
│   │       ├── UserRowView.swift
│   │       └── UserAvatarView.swift
│   └── Settings/
│       └── SettingsView.swift
├── ViewModels/
│   ├── UserViewModel.swift
│   └── SettingsViewModel.swift
├── Models/
│   ├── User.swift
│   └── Settings.swift
├── Services/
│   ├── UserService.swift
│   └── NetworkService.swift
└── Extensions/
    ├── View+Extensions.swift
    └── Color+Extensions.swift
```

### Naming Conventions

- **Views**: Descriptive names ending with "View" (`UserDetailView`)
- **ViewModels**: Model name + "ViewModel" (`UserViewModel`)
- **State properties**: Descriptive names with clear purpose (`isLoading`, `errorMessage`)
- **Methods**: Intent-based naming (`loadUsers()`, `saveProfile()`)
- **Custom modifiers**: Descriptive method names (`cardStyle()`, `emphasized()`)

## Quality Gates and Validation

### SwiftUI-Specific Quality Checklist

Before marking any SwiftUI implementation complete, verify:

#### Constitutional Compliance
- [ ] All interactive elements have accessibility labels and hints
- [ ] Proper Dynamic Type support implemented
- [ ] VoiceOver navigation tested and working
- [ ] All user-facing strings use semantic localization keys
- [ ] Dark mode appearance tested and appropriate
- [ ] Platform-appropriate navigation patterns used (iOS vs macOS)

#### Performance and Best Practices
- [ ] No expensive computations in view body
- [ ] Proper use of @State, @Binding, and environment
- [ ] View composition follows single-responsibility principle
- [ ] Lists optimized for performance with large datasets
- [ ] Proper error handling with user-friendly messages

#### Code Quality
- [ ] Views broken down into focused, reusable components
- [ ] Consistent naming conventions followed
- [ ] Proper file organization maintained
- [ ] ViewModels follow MVVM patterns correctly
- [ ] Dependencies injected through environment when appropriate

## Integration with Other ContextKit Components

### Error Handling with ErrorKit

All SwiftUI views should integrate with ErrorKit for consistent error handling:

```swift
import ErrorKit

struct NetworkAwareView: View {
   @State private var error: AppError?
   
   var body: some View {
      ContentView()
         .onAppear {
            Task {
               do {
                  try await loadData()
               } catch {
                  self.error = error.asAppError()
               }
            }
         }
         .alert("Error", isPresented: .constant(error != nil)) {
            Button("Retry") {
               Task {
                  await retryAction()
               }
            }
            Button("Cancel") {
               error = nil
            }
         } message: {
            if let error {
               Text(error.userFriendlyMessage)
            }
         }
   }
}
```

### Package-First Development

When creating new SwiftUI functionality:

1. **Start with Swift Package**: Create reusable components as packages first
2. **Define Clear APIs**: Establish public interfaces before implementation
3. **Independent Testing**: Ensure packages can be tested independently
4. **App Integration**: Import packages into main app projects

### Modern Swift Integration

Use modern Swift features in SwiftUI:

```swift
// Modern async/await patterns
struct ModernAsyncView: View {
   @State private var data: [Item] = []
   
   var body: some View {
      List(data, id: \.id) { item in
         ItemView(item: item)
      }
      .task {
         do {
            data = try await DataService.fetchItems()
         } catch {
            // Handle error
         }
      }
   }
}

// Modern switch expressions
struct StatusView: View {
   let status: Status
   
   var body: some View {
      Text(switch status {
      case .loading: "Loading..."
      case .success(let data): "Loaded \(data.count) items"
      case .failure(let error): "Error: \(error.localizedDescription)"
      })
   }
}
```

## Conclusion

These SwiftUI guidelines ensure:

1. **Constitutional Compliance**: Every view respects accessibility, localization, privacy, and platform standards
2. **Consistent Architecture**: MVVM patterns with clear separation of concerns
3. **Performance Optimization**: Efficient view updates and resource usage
4. **Code Quality**: Maintainable, testable, and reusable code
5. **Modern Swift**: Integration with latest Swift language features

Always validate implementations against the quality gates and constitutional principles before considering any SwiftUI work complete. The goal is not just working code, but code that upholds the highest standards of iOS and macOS development.

**Remember**: These guidelines work in conjunction with the broader ContextKit system - specs created through `/Plan/create-spec`, technical plans from `/Plan/define-tech`, and implementation tasks from `/Plan/plan-steps` should all reference and enforce these SwiftUI standards throughout the development process.