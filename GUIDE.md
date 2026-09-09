# sum two — GUIDE

## 1) Quick Start
- **Prerequisites:** Any modern web browser (Chrome/Edge/Firefox/Safari). Optional: Python 3 for local static server.
- **Install:** No dependency installation required.
- **Run (dev):**
  - Option A: Open `index.html` directly.
  - Option B: Run `python -m http.server 8080` from project root and visit `http://localhost:8080`.
- **Run (prod):** Deploy static files (`index.html`, `styles.css`, `script.js`) to any static hosting provider.

## 2) Configuration
- Environment variables: none required for app runtime.

| Name | Required | Default | Example | Description |
|------|----------|---------|---------|-------------|
| N/A | no | N/A | N/A | This static app does not use environment variables. |

- Files/paths:
  - `index.html`: app markup and form UI
  - `styles.css`: responsive styling
  - `script.js`: validation and sum logic

## 3) Running Locally
- Dev workflow:
  1. Open app by file URL or local server.
  2. Enter two values and click **Calculate**.
  3. Observe inline result or validation message.
- With Docker:
  - Build: `docker build -t sum-two:latest .`
  - Run: `docker run --rm -p 8080:80 sum-two:latest`
  - Open: `http://localhost:8080`
- Testing:
  - Manual tests: `tests/manual-test-cases.md`
  - No automated test framework included in this POC.

## 4) Build & Deploy
- Build:
  - No frontend bundling step is required (plain static files).
  - Optional container image build command:
    - `docker build -t sum-two:latest .`
- Deploy targets:
  - Static hosting (GitHub Pages, Netlify, Azure Static Web Apps)
  - Azure Container Instances via artifacts in `deploy/`
- Migrations/seed:
  - N/A (no database)
- Health checks/rollbacks:
  - Static host: request `/` and verify page loads.
  - Container deployment: request root URL and verify calculator UI renders.

## 5) Feature Walkthrough
- Overview: single-screen calculator for summing two numeric inputs with instant inline feedback.

- Screens/Commands
  - **Calculator Screen (`/`)**
    - Purpose: Accept two values and compute their sum.
    - Key interactions:
      - Enter values in “First number” and “Second number” fields.
      - Press **Calculate** to submit the form.
      - See `Sum: <value>` on success.
      - See validation error for invalid input.
    - Navigation/state:
      - Single page only; no route changes.
      - Result/error messages update in place.

## 6) API Reference
- Auth: none
- Conventions: no server/API layer in this app

### Client-side Interaction Contract
- **FORM SUBMIT** `#sum-form` — compute sum
  - Auth: not required
  - Query params: none
  - Body: browser form values (`valueA`, `valueB`)
  - Success behavior:
    ```json
    {
      "uiResult": "Sum: <number>",
      "errorVisible": false
    }
    ```
  - Validation failure behavior:
    ```json
    {
      "uiError": "Please enter valid numeric values in both fields.",
      "resultVisible": false
    }
    ```

## 7) Manual QA Test Scenarios
- How to use: Execute in a clean browser session. Test both local file mode and local server mode when possible.

### Calculator Core Flow
- Test 1 — Happy path integers
  - Preconditions: app loaded.
  - Steps:
    1) Enter `2` and `3`.
    2) Click **Calculate**.
  - Expected:
    - Result shows `Sum: 5`.
    - Error message hidden.

- Test 2 — Repeat calculation
  - Preconditions: Test 1 completed.
  - Steps:
    1) Change first input to `10`.
    2) Click **Calculate**.
  - Expected:
    - Result updates to `Sum: 13`.
    - No reload/navigation.

### Validation
- Test 3 — Non-numeric input
  - Preconditions: app loaded.
  - Steps:
    1) Enter `abc` and `2`.
    2) Click **Calculate**.
  - Expected:
    - Friendly error is shown.
    - Result is hidden.

- Test 4 — Empty input
  - Preconditions: app loaded.
  - Steps:
    1) Leave one or both fields empty.
    2) Click **Calculate**.
  - Expected:
    - Same validation error shown.

- Test 5 — Recovery from error
  - Preconditions: Validation error currently visible.
  - Steps:
    1) Edit invalid value to a valid number.
    2) Click **Calculate**.
  - Expected:
    - Error clears.
    - Correct sum appears.

### Responsiveness
- Test 6 — Mobile viewport usability
  - Preconditions: responsive mode enabled (375px width).
  - Steps:
    1) Load app and interact with inputs/button.
  - Expected:
    - All controls are visible, readable, and tappable.

## 8) Troubleshooting & FAQ
- **Q: I click Calculate and nothing happens.**
  - Ensure JavaScript is enabled and `script.js` is present in the same directory as `index.html`.
- **Q: Why do I see validation errors for blank fields?**
  - Blank strings are not treated as numbers by design.
- **Q: Can I run this without internet?**
  - Yes. It is fully local and static.
- Logs/observability:
  - Browser DevTools Console for runtime JS errors.

## 9) Support & Ownership
- Codeowners/contacts: TODO: add project owner/contact.
- Links:
  - Repo: TODO: add repository URL.
  - CI: TODO: add CI pipeline URL (if any).
  - Dashboards: N/A for this static POC.
  - Issue tracker: TODO: add issue tracker URL.

> Notes:
> - Unknown organizational metadata is marked as TODO.
> - This guide reflects verified behavior of the current repository contents.
