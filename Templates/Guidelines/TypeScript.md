# TypeScript Code Quality Guidelines
<!-- Template Version: 1 | ContextKit: 0.2.0 | Updated: 2025-10-02 -->

> **Purpose**: Reference guidelines for writing high-quality TypeScript code in web applications.
> **Usage**: Reference with `@Context/Guidelines/TypeScript.md` when implementing TypeScript features.

## Core Principles

### 1. Type Safety First
- **Strict Mode**: Always enable strict mode in tsconfig.json
- **Explicit Types**: Prefer explicit types over implicit any
- **No Type Assertions**: Avoid `as` unless absolutely necessary
- **Exhaustive Checks**: Use never type for exhaustive switch/if checks

```typescript
// ❌ Bad
function process(data: any) {
  return data.value;
}

// ✅ Good
interface Data {
  value: string;
}

function process(data: Data): string {
  return data.value;
}
```

### 2. Modern TypeScript Features
- **Use Union Types**: Prefer unions over enums when possible
- **Template Literal Types**: For string unions with patterns
- **Type Guards**: Create custom type guards for runtime checks
- **Utility Types**: Leverage Pick, Omit, Partial, Required, etc.

```typescript
// ✅ Type-safe API response handling
type ApiResponse<T> = 
  | { status: 'success'; data: T }
  | { status: 'error'; error: string };

function isSuccess<T>(response: ApiResponse<T>): response is { status: 'success'; data: T } {
  return response.status === 'success';
}
```

### 3. Function Design
- **Single Responsibility**: Each function should do one thing well
- **Pure Functions**: Prefer pure functions without side effects
- **Type Inference**: Let TypeScript infer return types when obvious
- **Async/Await**: Use async/await over raw promises

```typescript
// ✅ Clean async function
async function fetchUser(id: string): Promise<User> {
  const response = await fetch(`/api/users/${id}`);
  if (!response.ok) {
    throw new Error(`Failed to fetch user: ${response.statusText}`);
  }
  return response.json();
}
```

### 4. Error Handling
- **Type-Safe Errors**: Create custom error classes
- **Result Types**: Consider Result<T, E> pattern for expected errors
- **Try-Catch**: Use try-catch for unexpected errors
- **Error Boundaries**: Implement error boundaries in React/Vue

```typescript
// ✅ Type-safe error handling
class ValidationError extends Error {
  constructor(public field: string, message: string) {
    super(message);
    this.name = 'ValidationError';
  }
}

type Result<T, E = Error> = 
  | { ok: true; value: T }
  | { ok: false; error: E };
```

### 5. Code Organization
- **Module Exports**: Use named exports over default exports
- **Barrel Files**: Use index.ts for clean imports
- **Separation of Concerns**: Separate types, logic, and presentation
- **DRY Principle**: Extract reusable utilities and types

```typescript
// ✅ Clean module structure
// types.ts
export interface User {
  id: string;
  name: string;
  email: string;
}

// api.ts
export async function getUser(id: string): Promise<User> {
  // implementation
}

// index.ts
export { User } from './types';
export { getUser } from './api';
```

## Frontend-Specific Guidelines

### React/Next.js
- Use functional components with hooks
- Properly type props and state
- Use React.FC sparingly (prefer explicit props)
- Implement proper dependency arrays in useEffect

```typescript
// ✅ Properly typed React component
interface UserCardProps {
  user: User;
  onEdit: (id: string) => void;
}

function UserCard({ user, onEdit }: UserCardProps) {
  return (
    <div>
      <h2>{user.name}</h2>
      <button onClick={() => onEdit(user.id)}>Edit</button>
    </div>
  );
}
```

### Vue 3
- Use Composition API with TypeScript
- Define component props with defineProps
- Type refs and reactive objects properly
- Use computed types correctly

```typescript
// ✅ Vue 3 with TypeScript
<script setup lang="ts">
import { ref, computed } from 'vue';

interface User {
  id: string;
  name: string;
}

const props = defineProps<{
  user: User;
}>();

const isEditing = ref(false);
const displayName = computed(() => props.user.name.toUpperCase());
</script>
```

## Backend-Specific Guidelines

### Express/Node.js
- Type request/response objects
- Use middleware with proper types
- Implement request validation
- Type environment variables

```typescript
// ✅ Typed Express route
interface AuthRequest extends Request {
  user?: User;
}

app.get('/api/profile', (req: AuthRequest, res: Response) => {
  if (!req.user) {
    return res.status(401).json({ error: 'Unauthorized' });
  }
  res.json(req.user);
});
```

### Database/ORM
- Type database models
- Use proper query builders with types
- Implement type-safe migrations
- Validate data before DB operations

```typescript
// ✅ Prisma example
import { PrismaClient, User } from '@prisma/client';

const prisma = new PrismaClient();

async function createUser(data: Omit<User, 'id' | 'createdAt'>): Promise<User> {
  return prisma.user.create({ data });
}
```

## Testing Guidelines

### Unit Tests
- Type test fixtures and mocks
- Use type-safe assertions
- Test edge cases and error paths
- Mock external dependencies properly

```typescript
// ✅ Type-safe tests
import { describe, it, expect, vi } from 'vitest';

describe('fetchUser', () => {
  it('should fetch user successfully', async () => {
    const mockUser: User = {
      id: '1',
      name: 'John Doe',
      email: 'john@example.com'
    };
    
    global.fetch = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => mockUser
    });
    
    const user = await fetchUser('1');
    expect(user).toEqual(mockUser);
  });
});
```

## Common Patterns

### Dependency Injection
```typescript
interface Logger {
  log(message: string): void;
}

class UserService {
  constructor(private logger: Logger) {}
  
  async getUser(id: string): Promise<User> {
    this.logger.log(`Fetching user ${id}`);
    // implementation
  }
}
```

### Repository Pattern
```typescript
interface Repository<T> {
  findById(id: string): Promise<T | null>;
  create(data: Omit<T, 'id'>): Promise<T>;
  update(id: string, data: Partial<T>): Promise<T>;
  delete(id: string): Promise<void>;
}

class UserRepository implements Repository<User> {
  // implementation
}
```

### Builder Pattern
```typescript
class QueryBuilder {
  private conditions: string[] = [];
  
  where(condition: string): this {
    this.conditions.push(condition);
    return this;
  }
  
  build(): string {
    return this.conditions.join(' AND ');
  }
}
```

## Performance Considerations

1. **Avoid Type Complexity**: Deep nesting and complex mapped types slow compilation
2. **Use Type Aliases**: For frequently used complex types
3. **Lazy Loading**: Use dynamic imports for large modules
4. **Memoization**: Cache expensive computations

## Security Best Practices

1. **Input Validation**: Always validate user input with runtime checks
2. **SQL Injection**: Use parameterized queries or ORMs
3. **XSS Prevention**: Sanitize user-generated content
4. **Type Safety ≠ Security**: Runtime validation is still necessary

## Resources

- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [TypeScript Deep Dive](https://basarat.gitbook.io/typescript/)
- [Type Challenges](https://github.com/type-challenges/type-challenges)

---

**Note**: These guidelines should be adapted to your project's specific needs. Use as a reference, not strict rules.

