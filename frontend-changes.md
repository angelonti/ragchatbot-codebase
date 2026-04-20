# Frontend Changes

---

## Code Quality Tooling

### Overview
Added frontend code quality tooling with Prettier for formatting and ESLint for linting. Provides consistent code style enforcement for all HTML, JS, and CSS files.

### New Files

#### `frontend/package.json`
- Defines `prettier`, `eslint`, and `@eslint/js` as dev dependencies
- npm scripts: `format` (write), `format:check` (read-only), `lint` (ESLint)
- Install: `cd frontend && npm install`

#### `frontend/.prettierrc`
- 4-space indent, single quotes, trailing commas (ES5), semicolons
- `printWidth: 80`, `arrowParens: "always"`

#### `frontend/eslint.config.js`
- ESLint 9 flat config using `@eslint/js` recommended rules
- Browser globals + `marked` declared as read-only
- Rules: `eqeqeq: error`, `no-unused-vars: warn`, `no-console: warn`

#### `frontend/.prettierignore`
- Excludes `node_modules/`

#### `scripts/frontend-format.sh`
- Runs `prettier --write` on all frontend HTML/JS/CSS files
- Usage: `./scripts/frontend-format.sh`

#### `scripts/frontend-lint.sh`
- Runs `prettier --check` + `eslint` without modifying files
- Exit code 0 = all checks pass; non-zero = issues found
- Usage: `./scripts/frontend-lint.sh`

### Modified Files

#### `frontend/script.js`
Applied Prettier-consistent formatting throughout:
- Trailing commas added to all multi-line object literals and function call arguments
- `.map()` chains reformatted with method chaining on separate lines
- Redundant inline comments removed (self-explanatory code)
- Consistent arrow function parentheses (`(e) =>` not `e =>`)

### Setup

```bash
cd frontend
npm install
```

Then use the scripts from the repo root:

```bash
./scripts/frontend-format.sh   # auto-fix formatting
./scripts/frontend-lint.sh     # check only (CI-safe)
```

---

## Dark/Light Theme Toggle

## Overview
Added a toggle button that allows users to switch between dark and light themes for the Course Materials Assistant application.

## Files Modified

### 1. `frontend/index.html`
- Added a `.header-content` flex container to the `<header>` with `.header-text` on the left and the toggle button on the right
- Added `#themeToggle` button with inline sun and moon SVG icons and an `aria-label` attribute

### 2. `frontend/style.css`
- **Dark theme (default)** defined on `:root`
- **Light theme** defined on `[data-theme="light"]`
- `.header-content` uses `display: flex; justify-content: space-between` to push the toggle to the top-right
- `.theme-toggle`: circular 44×44 px button, `border-radius: 50%`, hover/focus/active states
- `.sun-icon` / `.moon-icon`: `position: absolute` siblings; the active icon has `opacity: 1, scale(1)`, the inactive one has `opacity: 0, rotate(±180deg) scale(0.8)` — both animated with `transition: all 0.3s ease`
- `body` and `*` selectors carry `transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease` for smooth theme switching
- Responsive: on screens ≤ 768 px the header stacks vertically and the toggle aligns to the right

### 3. `frontend/script.js`
- `themeToggle` DOM reference added alongside other element refs
- `initializeTheme()` — reads `localStorage.getItem('theme')`, defaults to `'dark'`
- `toggleTheme()` — reads the current `data-theme` attribute on `document.documentElement` and calls `setTheme()` with the opposite value
- `setTheme(theme)` — sets/removes `data-theme="light"` on `<html>`, updates `aria-label`, persists to `localStorage`
- Keyboard shortcut `Ctrl/Cmd + Shift + T` also calls `toggleTheme()`

## Theme Variables

### Dark Theme (default, `:root`)
| Variable | Value |
|---|---|
| `--background` | `#0f172a` |
| `--surface` | `#1e293b` |
| `--surface-hover` | `#334155` |
| `--text-primary` | `#f1f5f9` |
| `--text-secondary` | `#94a3b8` |
| `--border-color` | `#334155` |
| `--shadow` | `rgba(0,0,0,0.3)` |

### Light Theme (`[data-theme="light"]`)
| Variable | Value |
|---|---|
| `--background` | `#ffffff` |
| `--surface` | `#f8fafc` |
| `--surface-hover` | `#e2e8f0` |
| `--text-primary` | `#1e293b` |
| `--text-secondary` | `#64748b` |
| `--border-color` | `#e2e8f0` |
| `--shadow` | `rgba(0,0,0,0.1)` |

Both themes share `--primary-color: #2563eb`, `--primary-hover: #1d4ed8`, `--user-message: #2563eb`, and `--radius: 12px`.

## Feature Checklist

- [x] Toggle button in top-right corner of header
- [x] Sun (dark mode) / Moon (light mode) SVG icon pair with rotation + opacity animation
- [x] Smooth 0.3 s transitions on all theme-sensitive properties
- [x] `data-theme` attribute on `<html>` element drives all CSS variable overrides
- [x] Theme preference persisted in `localStorage`; dark is the default for new visitors
- [x] `aria-label` updates dynamically ("Switch to light/dark theme")
- [x] Keyboard shortcut: `Ctrl/Cmd + Shift + T`
- [x] Responsive layout — button remains accessible at all viewport sizes
