# Swift Development Guidelines

**Version**: 1.0.0  
**Effective**: 2025-01-26  
**Prerequisites**: [ContextKit Constitution](../ContextKit/Constitution.md)  
**Status**: Core Swift patterns and conventions for ContextKit development

## Preamble

These guidelines establish Swift development patterns, modern API preferences, and coding conventions that align with ContextKit's constitutional principles. They focus on maintainable, accessible, and localization-ready Swift code that embraces modern Swift features and platform best practices.

**Constitutional Integration**: All guidelines reinforce constitutional principles through specific technical patterns and validation requirements.

---

## Article I: Modern Swift Language Patterns

**Principle**: Embrace modern Swift language features that improve code clarity, safety, and maintainability.

### Section 1.1 - Temporal API Adoption

**Date.now over Date()**: Always use modern temporal APIs
```swift
// ✅ Preferred - Modern temporal API
let currentTime = Date.now
let deadline = Date.now.addingTimeInterval(.seconds(30))

// ❌ Avoid - Legacy pattern
let currentTime = Date()
```

**Duration over TimeInterval**: Use type-safe duration values
```swift
// ✅ Preferred - Type-safe duration
let timeout: Duration = .seconds(30)
let delay: Duration = .milliseconds(250)

func wait(for duration: Duration) async throws {
    try await Task.sleep(for: duration)
}

// ❌ Avoid - Raw time intervals
let timeout: TimeInterval = 30.0
```

### Section 1.2 - Switch Expression Patterns

**Modern switch expressions** for value assignment and returns:
```swift
// ✅ Preferred - Switch expression
let message = switch status {
case .loading: "Loading..."
case .success: "Data loaded successfully"
case .failure: "Failed to load data"
}

// ✅ Preferred - Switch expression with complex logic
let priority = switch (urgency, importance) {
case (.high, .high): Priority.critical
case (.high, .medium), (.medium, .high): Priority.high
case (.medium, .medium): Priority.normal
default: Priority.low
}

// ❌ Avoid - Traditional switch statement
var message: String
switch status {
case .loading: message = "Loading..."
case .success: message = "Data loaded successfully"  
case .failure: message = "Failed to load data"
}
```

### Section 1.3 - Optional Handling Modernization

**Prefer guard-let and if-let over force unwrapping**:
```swift
// ✅ Preferred - Safe optional binding
guard let user = authenticatedUser else {
    throw AuthError.notAuthenticated
}

// ✅ Preferred - Multiple optional binding
if let name = user.name, let email = user.email {
    sendWelcomeEmail(name: name, email: email)
}

// ❌ Avoid - Force unwrapping
let user = authenticatedUser!
```

**Modern optional chaining patterns**:
```swift
// ✅ Preferred - Nil coalescing with default
let displayName = user.profile?.displayName ?? "Anonymous User"

// ✅ Preferred - Optional map for transformations
let uppercasedName = user.name?.uppercased()
```

### Section 1.4 - String Manipulation Modernization

**Use modern string replacement methods**:
```swift
// ✅ Preferred - Modern replacement API
let cleanedText = originalText.replacing("old", with: "new")
let multipleReplacements = text
    .replacing("&", with: "&amp;")
    .replacing("<", with: "&lt;")
    .replacing(">", with: "&gt;")

// ❌ Avoid - Legacy string replacement
let cleanedText = originalText.replacingOccurrences(of: "old", with: "new")
```

---

## Article II: Code Style and Formatting

**Principle**: Consistent code style improves maintainability and team collaboration.

### Section 2.1 - Indentation Standards

**3-space indentation**: Mandatory across all Swift files
```swift
// ✅ Preferred - 3-space indentation
class UserService {
   func fetchUser(id: String) async throws -> User {
      let request = URLRequest(url: userURL(for: id))
      let (data, _) = try await URLSession.shared.data(for: request)
      
      do {
         let user = try JSONDecoder().decode(User.self, from: data)
         return user
      } catch {
         throw UserServiceError.decodingFailed(error)
      }
   }
}

// ❌ Avoid - Other indentation styles
class UserService {
    func fetchUser(id: String) async throws -> User {  // 4 spaces
        // ...
    }
}
```

### Section 2.2 - Naming Conventions

**Clarity over brevity**: Use descriptive names that explain intent
```swift
// ✅ Preferred - Clear, descriptive names
func authenticateUser(with credentials: Credentials) async throws -> AuthenticatedSession
var isUserAuthenticationInProgress: Bool
let maximumRetryAttempts = 3

// ❌ Avoid - Abbreviated or unclear names  
func authUser(creds: Creds) async throws -> Session
var authInProgress: Bool
let maxRetries = 3
```

**SwiftUI view naming**: Use descriptive, intention-revealing names
```swift
// ✅ Preferred - Intention-revealing view names
struct LoginCredentialsForm: View { }
struct UserProfileImage: View { }
struct LoadingIndicatorOverlay: View { }

// ❌ Avoid - Generic or unclear names
struct Form: View { }
struct ImageView: View { }
struct Overlay: View { }
```

### Section 2.3 - Type Declaration Patterns

**Prefer type inference where clarity is maintained**:
```swift
// ✅ Preferred - Clear type inference
let users = [User]()
let usernames = users.map(\.name)
let isValid = username.count >= 3

// ✅ Explicit types when needed for clarity
let timeout: Duration = .seconds(30)
let priority: TaskPriority = .userInitiated
```

**Protocol conformance organization**:
```swift
// ✅ Preferred - Organized extensions
struct User {
   let id: UUID
   let name: String
   let email: String
}

extension User: Identifiable { }

extension User: Codable { }

extension User: CustomStringConvertible {
   var description: String {
      "User(name: \(name), email: \(email))"
   }
}
```

---

## Article III: Architecture Patterns

**Principle**: Follow consistent architectural patterns that support maintainability and testability.

### Section 3.1 - Package-First Development (Constitutional Requirement)

**All reusable functionality MUST start as Swift packages**:
```swift
// ✅ Preferred - Package structure
Package(
   name: "UserManagement",
   platforms: [.iOS(.v17), .macOS(.v14)],
   products: [
      .library(name: "UserManagement", targets: ["UserManagement"])
   ],
   dependencies: [
      .package(url: "https://github.com/FlineDev/ErrorKit", from: "1.0.0")
   ],
   targets: [
      .target(
         name: "UserManagement",
         dependencies: ["ErrorKit"]
      ),
      .testTarget(
         name: "UserManagementTests",
         dependencies: ["UserManagement"]
      )
   ]
)
```

**Clear API boundaries**: Define public interfaces explicitly
```swift
// ✅ Preferred - Explicit public API
public struct UserService {
   public init() { }
   
   public func fetchUser(id: UUID) async throws -> User {
      // Implementation
   }
}

// Internal implementation details remain private
private extension UserService {
   func validateUserId(_ id: UUID) throws {
      // Validation logic
   }
}
```

### Section 3.2 - SwiftUI Architectural Patterns

**Prefer SwiftUI over UIKit** for new development (Constitutional Requirement):
```swift
// ✅ Preferred - Pure SwiftUI approach
struct UserProfileView: View {
   @State private var user: User?
   @State private var isLoading = false
   
   var body: some View {
      Group {
         if let user {
            UserDetailView(user: user)
         } else if isLoading {
            ProgressView("Loading user profile...")
         } else {
            ContentUnavailableView("No user data", systemImage: "person.slash")
         }
      }
      .task {
         await loadUser()
      }
   }
}

// ❌ Avoid - UIKit representables unless absolutely necessary
struct UIKitWrapperView: UIViewRepresentable { /* ... */ }
```

**MVVM with dependency injection**:
```swift
// ✅ Preferred - Clean MVVM pattern
@Observable
class UserProfileViewModel {
   var user: User?
   var isLoading = false
   var errorMessage: String?
   
   private let userService: UserService
   
   init(userService: UserService) {
      self.userService = userService
   }
   
   func loadUser(id: UUID) async {
      isLoading = true
      defer { isLoading = false }
      
      do {
         user = try await userService.fetchUser(id: id)
         errorMessage = nil
      } catch {
         errorMessage = error.localizedDescription
      }
   }
}
```

### Section 3.3 - Error Handling Architecture (Constitutional Requirement)

**Use typed throws with ErrorKit patterns**:
```swift
import ErrorKit

// ✅ Preferred - Typed throws with ErrorKit
enum UserServiceError: Error, Throwable {
   case networkUnavailable
   case invalidCredentials
   case userNotFound(UUID)
   
   var userMessage: String {
      switch self {
      case .networkUnavailable:
         return "Please check your internet connection"
      case .invalidCredentials:
         return "Please verify your login credentials"
      case .userNotFound:
         return "User profile could not be found"
      }
   }
}

func fetchUser(id: UUID) async throws(UserServiceError) -> User {
   // Implementation with typed throws
}

// ✅ Error propagation with Catching protocol
struct UserRepository: Catching {
   func getUser(id: UUID) async throws -> User {
      try await catching(UserServiceError.self) {
         try await userService.fetchUser(id: id)
      }
   }
}
```

**UI error state handling**:
```swift
// ✅ Preferred - User-friendly error display
struct ErrorStateView: View {
   let error: Error
   let retryAction: () -> Void
   
   var body: some View {
      ContentUnavailableView {
         Label("Something went wrong", systemImage: "exclamationmark.triangle")
      } description: {
         Text(userFriendlyMessage(for: error))
      } actions: {
         Button("Try Again", action: retryAction)
      }
   }
   
   private func userFriendlyMessage(for error: Error) -> String {
      if let throwableError = error as? Throwable {
         return throwableError.userMessage
      }
      return "An unexpected error occurred. Please try again."
   }
}
```

---

## Article IV: Constitutional Principle Integration

**Principle**: All Swift code must actively support constitutional requirements through specific implementation patterns.

### Section 4.1 - Accessibility-First Implementation (Article I)

**SwiftUI accessibility patterns**:
```swift
// ✅ Preferred - Comprehensive accessibility support
struct LoginButton: View {
   let action: () -> Void
   @State private var isLoading = false
   
   var body: some View {
      Button(action: action) {
         if isLoading {
            ProgressView()
               .controlSize(.small)
         } else {
            Text("Sign In")
         }
      }
      .accessibilityLabel("Sign in to your account")
      .accessibilityHint("Double tap to log in with your credentials")
      .accessibilityAddTraits(isLoading ? .updatesFrequently : [])
      .disabled(isLoading)
   }
}

// ✅ Dynamic Type support
struct UserNameLabel: View {
   let name: String
   
   var body: some View {
      Text(name)
         .font(.headline)
         .dynamicTypeSize(...DynamicTypeSize.accessibility3)
         .lineLimit(2)
   }
}
```

**Semantic colors for accessibility**:
```swift
// ✅ Preferred - Semantic color usage
Color.primary        // Adapts to light/dark mode
Color.secondary      // Appropriate contrast ratios
Color.accentColor    // User's preferred accent
Color.red            // Semantic meaning preserved

// ❌ Avoid - Fixed colors that don't adapt
Color(red: 0.2, green: 0.4, blue: 0.6)
```

### Section 4.2 - Localization-Ready Patterns (Article III)

**String externalization with semantic keys**:
```swift
// ✅ Preferred - Semantic localization keys
extension LocalizedStringKey {
   static let welcomeMessage = LocalizedStringKey("welcome_message")
   static let loginButtonTitle = LocalizedStringKey("login_button_title")
   static let errorNetworkUnavailable = LocalizedStringKey("error_network_unavailable")
}

// Usage in SwiftUI
Text(.welcomeMessage)
Button(.loginButtonTitle) { /* action */ }

// ❌ Avoid - Hardcoded strings
Text("Welcome to our app!")
Button("Login") { /* action */ }
```

**String Catalog integration**:
```swift
// ✅ Preferred - Contextual localization with comments
/// Localizable.xcstrings entry:
/// Key: "user_profile_loading_state"  
/// Comment: "Shown while user profile data is being fetched from server"
/// Value: "Loading profile..."

Text("user_profile_loading_state", comment: "Loading state for user profile")
```

**Locale-aware formatting**:
```swift
// ✅ Preferred - Locale-aware formatting
let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.locale = Locale.current

let priceText = formatter.string(from: NSNumber(value: price)) ?? "—"

// Date formatting with locale
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .short
dateFormatter.locale = Locale.current

let formattedDate = dateFormatter.string(from: date)
```

### Section 4.3 - Privacy by Design Implementation (Article II)

**Privacy-conscious data handling**:
```swift
// ✅ Preferred - Minimal data collection with explicit purpose
struct UserPreferences: Codable {
   let preferredLanguage: String
   let isDarkModeEnabled: Bool
   let notificationsEnabled: Bool
   
   // No personally identifiable information stored
   // No tracking or analytics data included
}

// ✅ Secure storage patterns
extension UserPreferences {
   private static let preferencesKey = "user_preferences"
   
   static func load() -> UserPreferences? {
      // Use Keychain for sensitive data
      // Use UserDefaults only for non-sensitive preferences
      guard let data = UserDefaults.standard.data(forKey: preferencesKey) else {
         return nil
      }
      
      return try? JSONDecoder().decode(UserPreferences.self, from: data)
   }
}
```

**Privacy manifest integration**:
```swift
// ✅ Document privacy impact in code comments
/// Privacy Manifest Impact: NSUserTrackingUsageDescription
/// This function enables user tracking for analytics purposes.
/// User consent is required before calling.
func enableAnalytics() async {
   guard await requestTrackingPermission() else { return }
   // Enable analytics only after explicit consent
}
```

### Section 4.4 - Code Maintainability Enforcement (Article IV)

**Function decomposition patterns**:
```swift
// ✅ Preferred - Single responsibility functions
func authenticateUser(credentials: Credentials) async throws -> AuthenticatedSession {
   try validateCredentials(credentials)
   let session = try await performAuthentication(credentials)
   try await updateUserSession(session)
   return session
}

private func validateCredentials(_ credentials: Credentials) throws {
   guard !credentials.username.isEmpty else {
      throw AuthError.missingUsername
   }
   
   guard credentials.password.count >= 8 else {
      throw AuthError.passwordTooShort
   }
}

private func performAuthentication(_ credentials: Credentials) async throws -> AuthenticatedSession {
   // Focused authentication logic
}

// ❌ Avoid - Monolithic functions with multiple responsibilities
func authenticateUser(username: String, password: String) async throws -> AuthenticatedSession {
   // 50+ lines of mixed validation, authentication, and session management
}
```

**Dependency management**:
```swift
// ✅ Preferred - Explicit dependency injection
protocol UserRepository {
   func getUser(id: UUID) async throws -> User
   func saveUser(_ user: User) async throws
}

struct UserService {
   private let repository: UserRepository
   private let logger: Logger
   
   init(repository: UserRepository, logger: Logger = .userService) {
      self.repository = repository
      self.logger = logger
   }
}

// ❌ Avoid - Hidden dependencies or singletons
struct UserService {
   func getUser(id: UUID) async throws -> User {
      // Direct database access without abstraction
      return try await DatabaseManager.shared.fetchUser(id: id)
   }
}
```

---

## Article V: Modern API Preferences

**Principle**: Favor modern, type-safe APIs that improve code clarity and reduce errors.

### Section 5.1 - Async/Await Patterns

**Prefer async/await over completion handlers**:
```swift
// ✅ Preferred - Modern async/await
func fetchUserData(for userID: UUID) async throws -> UserData {
   async let profile = fetchUserProfile(userID)
   async let preferences = fetchUserPreferences(userID)
   async let metadata = fetchUserMetadata(userID)
   
   return try await UserData(
      profile: profile,
      preferences: preferences,
      metadata: metadata
   )
}

// ❌ Avoid - Completion handler callbacks
func fetchUserData(for userID: UUID, completion: @escaping (Result<UserData, Error>) -> Void) {
   // Nested callback complexity
}
```

**Task management patterns**:
```swift
// ✅ Preferred - Structured concurrency
struct UserDataLoader {
   func loadAllUsers() async throws -> [User] {
      try await withThrowingTaskGroup(of: User.self) { group in
         for userID in userIDs {
            group.addTask {
               try await fetchUser(id: userID)
            }
         }
         
         var users: [User] = []
         for try await user in group {
            users.append(user)
         }
         return users
      }
   }
}
```

### Section 5.2 - Collection Processing

**Modern collection algorithms**:
```swift
// ✅ Preferred - Modern collection methods
let activeUsers = users
   .filter(\.isActive)
   .sorted(using: KeyPathComparator(\.lastLoginDate, order: .reverse))
   .prefix(10)

// ✅ Dictionary grouping
let usersByRole = Dictionary(grouping: users, by: \.role)

// ✅ Conditional mapping
let usernames = users.compactMap { user in
   user.isActive ? user.name : nil
}

// ❌ Avoid - Imperative loops where functional approaches are clearer
var activeUsers: [User] = []
for user in users {
   if user.isActive {
      activeUsers.append(user)
   }
}
```

### Section 5.3 - Result Builders and DSLs

**SwiftUI result builder patterns**:
```swift
// ✅ Preferred - Natural SwiftUI composition
struct UserDetailView: View {
   let user: User
   
   var body: some View {
      VStack(alignment: .leading, spacing: 16) {
         UserAvatarView(user: user)
         
         UserInfoSection(user: user)
         
         UserActionsSection(user: user)
      }
      .padding()
      .navigationTitle(user.name)
      .navigationBarTitleDisplayMode(.large)
   }
}
```

---

## Article VI: Quality Assurance Integration

**Principle**: Code quality must be enforced through automated tools and validation gates.

### Section 6.1 - Automated Formatting

**SwiftFormat configuration** (applied automatically via PostToolUse hook):
```swift
// Automatic formatting ensures:
// - 3-space indentation
// - Consistent bracket placement  
// - Proper spacing around operators
// - Aligned property declarations
```

**swift-format integration** for Apple-style formatting:
```json
// .swift-format configuration
{
  "indentation": {
    "spaces": 3
  },
  "maximumBlankLines": 1,
  "respectsExistingLineBreaks": true,
  "rules": {
    "AllPublicDeclarationsHaveDocumentation": false,
    "NeverForceUnwrap": true,
    "NoAccessLevelOnExtensionDeclaration": true
  }
}
```

### Section 6.2 - Code Quality Gates

**Validation through subagents**:
- `check-modern-code`: Ensures modern Swift patterns are used
- `check-accessibility`: Validates accessibility implementation
- `check-localization`: Confirms proper string externalization
- `check-error-handling`: Verifies ErrorKit pattern usage
- `check-code-debt`: Removes AI-generated artifacts and cleans up code

### Section 6.3 - Testing Patterns

**Test organization and naming**:
```swift
// ✅ Preferred - Descriptive test naming
final class UserServiceTests: XCTestCase {
   func test_fetchUser_withValidID_returnsUser() async throws {
      // Arrange
      let userService = UserService(repository: MockUserRepository())
      let userID = UUID()
      
      // Act
      let user = try await userService.fetchUser(id: userID)
      
      // Assert
      XCTAssertEqual(user.id, userID)
   }
   
   func test_fetchUser_withInvalidID_throwsUserNotFoundError() async {
      // Test error conditions
   }
}
```

---

## Constitutional Compliance Checklist

Before completing any Swift implementation, verify:

### Accessibility (Article I)
- [ ] All UI elements have appropriate accessibility labels
- [ ] Dynamic Type is supported
- [ ] Color is not the sole means of conveying information
- [ ] Keyboard navigation works properly
- [ ] VoiceOver testing has been performed

### Privacy (Article II)  
- [ ] Minimal data collection implemented
- [ ] Privacy Manifest updated if needed
- [ ] Secure storage patterns used
- [ ] User consent obtained where required

### Localization (Article III)
- [ ] No hardcoded user-facing strings
- [ ] Semantic localization keys used
- [ ] Regional formatting applied
- [ ] String Catalog integration complete

### Maintainability (Article IV)
- [ ] Functions have single responsibilities
- [ ] Dependencies are explicit and minimal
- [ ] ErrorKit patterns used for error handling
- [ ] Code formatting applied automatically

### Platform UX (Article V)
- [ ] Human Interface Guidelines followed
- [ ] Platform conventions respected
- [ ] System integration appropriate
- [ ] Performance requirements met

---

**Remember**: These guidelines work in service of ContextKit's constitutional principles. When in doubt, prioritize accessibility, privacy, localizability, and maintainability over convenience or performance optimization.

---

**This Swift guidelines document ensures that all Swift code written within the ContextKit ecosystem upholds constitutional principles while embracing modern language features and platform best practices.**