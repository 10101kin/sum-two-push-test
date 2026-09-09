# sum two

A simple static single-page calculator demo that adds two numbers in the browser.

## Scope
- Two input fields
- One **Calculate** action
- Inline result rendering
- Friendly validation message for invalid input
- No backend, no database, no external libraries

## Project Structure

```txt
sum two-v6/
├── index.html
├── styles.css
├── script.js
├── README.md
├── GUIDE.md
├── Dockerfile
├── .dockerignore
├── deploy/
│   ├── main.bicep
│   ├── parameters.json
│   ├── README.md
│   ├── DOCKER_NOTE.txt
│   └── verification_summary.json
└── tests/
    └── manual-test-cases.md
```

## Run Locally

### Option 1: Open directly
Open `index.html` in a browser.

### Option 2: Local static server (recommended)
From the project root:

```bash
python -m http.server 8080
```

Then open: `http://localhost:8080`

## Usage
1. Enter a value in **First number**.
2. Enter a value in **Second number**.
3. Click **Calculate**.
4. See result (`Sum: ...`) on the page.
5. For invalid input, fix fields and recalculate.

## Validation Behavior
- Empty values are invalid.
- Non-numeric values (e.g., `abc`) are invalid.
- Numeric values (including decimals and negatives) are valid.

## Verification Quick Checks
- `2` + `3` => `Sum: 5`
- Change to `10` + `3` => `Sum: 13`
- `abc` + `2` => friendly error message and no sum
- Correct input after error => error clears and valid sum appears

## Deployment Notes
- App can be hosted on any static host (GitHub Pages, Netlify, Azure Static Web Apps).
- Container and Azure ACI deployment artifacts are included under `deploy/` for demo purposes.
