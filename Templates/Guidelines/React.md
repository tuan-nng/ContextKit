# React Best Practices Guidelines
<!-- Template Version: 1 | ContextKit: 0.2.0 | Updated: 2025-10-02 -->

> **Purpose**: Reference guidelines for writing high-quality React applications.
> **Usage**: Reference with `@Context/Guidelines/React.md` when implementing React features.

## Core Principles

### 1. Component Design
- **Functional Components**: Always use functional components with hooks
- **Single Responsibility**: Each component should have one clear purpose
- **Composition**: Prefer composition over inheritance
- **Props Interface**: Always define TypeScript interfaces for props

```tsx
// ✅ Good component design
interface ButtonProps {
  variant: 'primary' | 'secondary';
  onClick: () => void;
  children: React.ReactNode;
  disabled?: boolean;
}

export function Button({ variant, onClick, children, disabled = false }: ButtonProps) {
  return (
    <button 
      className={`btn btn-${variant}`}
      onClick={onClick}
      disabled={disabled}
    >
      {children}
    </button>
  );
}
```

### 2. State Management
- **Local State First**: Use useState for component-specific state
- **Derived State**: Use useMemo for computed values
- **Global State**: Use Context API or Zustand/Jotai for shared state
- **Server State**: Use React Query or SWR for API data

```tsx
// ✅ Proper state management
function UserList() {
  const [searchTerm, setSearchTerm] = useState('');
  const { data: users, isLoading } = useQuery({
    queryKey: ['users'],
    queryFn: fetchUsers
  });
  
  const filteredUsers = useMemo(() => 
    users?.filter(u => u.name.includes(searchTerm)) ?? [],
    [users, searchTerm]
  );
  
  if (isLoading) return <Spinner />;
  return <UserTable users={filteredUsers} />;
}
```

### 3. Hooks Best Practices
- **Custom Hooks**: Extract reusable logic into custom hooks
- **Dependency Arrays**: Always specify correct dependencies
- **Hook Order**: Never call hooks conditionally
- **Cleanup**: Always cleanup effects that need it

```tsx
// ✅ Custom hook with cleanup
function useWebSocket(url: string) {
  const [data, setData] = useState<Message | null>(null);
  
  useEffect(() => {
    const ws = new WebSocket(url);
    
    ws.onmessage = (event) => {
      setData(JSON.parse(event.data));
    };
    
    return () => {
      ws.close();
    };
  }, [url]);
  
  return data;
}
```

### 4. Performance Optimization
- **React.memo**: Memoize expensive components
- **useCallback**: Memoize callback functions passed as props
- **useMemo**: Memoize expensive computations
- **Lazy Loading**: Use React.lazy for code splitting

```tsx
// ✅ Performance optimizations
const ExpensiveComponent = memo(function ExpensiveComponent({ data }: Props) {
  const processed = useMemo(() => processData(data), [data]);
  return <div>{processed}</div>;
});

function Parent() {
  const handleClick = useCallback(() => {
    console.log('clicked');
  }, []);
  
  return <ExpensiveComponent data={data} onClick={handleClick} />;
}

// Lazy loading
const Dashboard = lazy(() => import('./Dashboard'));
```

## Component Patterns

### Container/Presentational Pattern
```tsx
// Presentational (UI only)
interface UserCardProps {
  user: User;
  onEdit: () => void;
}

function UserCard({ user, onEdit }: UserCardProps) {
  return (
    <div className="card">
      <h3>{user.name}</h3>
      <button onClick={onEdit}>Edit</button>
    </div>
  );
}

// Container (logic)
function UserCardContainer({ userId }: { userId: string }) {
  const { data: user } = useQuery(['user', userId], () => fetchUser(userId));
  const editMutation = useMutation(updateUser);
  
  if (!user) return <Skeleton />;
  
  return (
    <UserCard 
      user={user} 
      onEdit={() => editMutation.mutate(user)} 
    />
  );
}
```

### Compound Components Pattern
```tsx
interface TabsContextType {
  activeTab: string;
  setActiveTab: (tab: string) => void;
}

const TabsContext = createContext<TabsContextType | null>(null);

export function Tabs({ children }: { children: React.ReactNode }) {
  const [activeTab, setActiveTab] = useState('');
  return (
    <TabsContext.Provider value={{ activeTab, setActiveTab }}>
      <div className="tabs">{children}</div>
    </TabsContext.Provider>
  );
}

Tabs.List = function TabsList({ children }: { children: React.ReactNode }) {
  return <div className="tabs-list">{children}</div>;
};

Tabs.Tab = function Tab({ id, children }: { id: string; children: React.ReactNode }) {
  const context = useContext(TabsContext);
  if (!context) throw new Error('Tab must be used within Tabs');
  
  return (
    <button 
      className={context.activeTab === id ? 'active' : ''}
      onClick={() => context.setActiveTab(id)}
    >
      {children}
    </button>
  );
};

// Usage
<Tabs>
  <Tabs.List>
    <Tabs.Tab id="home">Home</Tabs.Tab>
    <Tabs.Tab id="profile">Profile</Tabs.Tab>
  </Tabs.List>
</Tabs>
```

### Render Props Pattern
```tsx
interface MouseTrackerProps {
  children: (position: { x: number; y: number }) => React.ReactNode;
}

function MouseTracker({ children }: MouseTrackerProps) {
  const [position, setPosition] = useState({ x: 0, y: 0 });
  
  useEffect(() => {
    const handleMove = (e: MouseEvent) => {
      setPosition({ x: e.clientX, y: e.clientY });
    };
    
    window.addEventListener('mousemove', handleMove);
    return () => window.removeEventListener('mousemove', handleMove);
  }, []);
  
  return <>{children(position)}</>;
}

// Usage
<MouseTracker>
  {({ x, y }) => <div>Mouse at {x}, {y}</div>}
</MouseTracker>
```

## Form Handling

### Controlled Components
```tsx
function LoginForm() {
  const [formData, setFormData] = useState({ email: '', password: '' });
  const [errors, setErrors] = useState<Record<string, string>>({});
  
  const validate = (): boolean => {
    const newErrors: Record<string, string> = {};
    if (!formData.email) newErrors.email = 'Email required';
    if (!formData.password) newErrors.password = 'Password required';
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };
  
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!validate()) return;
    await login(formData);
  };
  
  return (
    <form onSubmit={handleSubmit}>
      <input
        type="email"
        value={formData.email}
        onChange={(e) => setFormData({ ...formData, email: e.target.value })}
      />
      {errors.email && <span className="error">{errors.email}</span>}
      {/* ... */}
    </form>
  );
}
```

### Using React Hook Form
```tsx
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';

const schema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
});

type FormData = z.infer<typeof schema>;

function LoginForm() {
  const { register, handleSubmit, formState: { errors } } = useForm<FormData>({
    resolver: zodResolver(schema),
  });
  
  const onSubmit = async (data: FormData) => {
    await login(data);
  };
  
  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input {...register('email')} />
      {errors.email && <span>{errors.email.message}</span>}
      <input type="password" {...register('password')} />
      {errors.password && <span>{errors.password.message}</span>}
      <button type="submit">Login</button>
    </form>
  );
}
```

## Error Boundaries

```tsx
interface ErrorBoundaryProps {
  children: React.ReactNode;
  fallback?: React.ReactNode;
}

interface ErrorBoundaryState {
  hasError: boolean;
  error?: Error;
}

class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  state: ErrorBoundaryState = { hasError: false };
  
  static getDerivedStateFromError(error: Error): ErrorBoundaryState {
    return { hasError: true, error };
  }
  
  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error('Error caught by boundary:', error, errorInfo);
  }
  
  render() {
    if (this.state.hasError) {
      return this.props.fallback || (
        <div className="error-boundary">
          <h2>Something went wrong</h2>
          <p>{this.state.error?.message}</p>
        </div>
      );
    }
    
    return this.props.children;
  }
}
```

## Testing Best Practices

### Component Testing
```tsx
import { render, screen, fireEvent } from '@testing-library/react';
import { describe, it, expect, vi } from 'vitest';

describe('Button', () => {
  it('calls onClick when clicked', () => {
    const handleClick = vi.fn();
    render(<Button onClick={handleClick}>Click me</Button>);
    
    fireEvent.click(screen.getByText('Click me'));
    expect(handleClick).toHaveBeenCalledOnce();
  });
  
  it('is disabled when disabled prop is true', () => {
    render(<Button onClick={vi.fn()} disabled>Click me</Button>);
    expect(screen.getByRole('button')).toBeDisabled();
  });
});
```

### Hook Testing
```tsx
import { renderHook, waitFor } from '@testing-library/react';

describe('useWebSocket', () => {
  it('connects and receives messages', async () => {
    const { result } = renderHook(() => useWebSocket('ws://localhost'));
    
    await waitFor(() => {
      expect(result.current.data).toBeDefined();
    });
  });
});
```

## Accessibility (a11y)

- **Semantic HTML**: Use proper HTML elements
- **ARIA Labels**: Add aria-labels for screen readers
- **Keyboard Navigation**: Ensure keyboard accessibility
- **Focus Management**: Handle focus properly in modals/dialogs

```tsx
function Dialog({ isOpen, onClose, children }: DialogProps) {
  const dialogRef = useRef<HTMLDivElement>(null);
  
  useEffect(() => {
    if (isOpen) {
      dialogRef.current?.focus();
    }
  }, [isOpen]);
  
  if (!isOpen) return null;
  
  return (
    <div
      ref={dialogRef}
      role="dialog"
      aria-modal="true"
      tabIndex={-1}
      onKeyDown={(e) => e.key === 'Escape' && onClose()}
    >
      {children}
      <button onClick={onClose} aria-label="Close dialog">×</button>
    </div>
  );
}
```

## Common Anti-Patterns to Avoid

❌ **Prop Drilling**: Pass props through many layers
✅ Use Context API or state management library

❌ **Huge Components**: Components with 500+ lines
✅ Break into smaller, focused components

❌ **Incorrect Dependencies**: Missing or wrong useEffect deps
✅ Use ESLint exhaustive-deps rule

❌ **Mutating State**: Directly modifying state objects
✅ Create new objects/arrays when updating state

❌ **Index as Key**: Using array index as key in lists
✅ Use stable, unique identifiers

## Resources

- [React Documentation](https://react.dev/)
- [React TypeScript Cheatsheet](https://react-typescript-cheatsheet.netlify.app/)
- [Testing Library](https://testing-library.com/react)
- [React Patterns](https://reactpatterns.com/)

---

**Note**: Adapt these patterns to your project's needs and tech stack.

