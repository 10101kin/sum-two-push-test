# Manual Test Cases — sum two

## Environment
- Browser: Chrome, Edge, Firefox, Safari (latest)
- Optional mobile viewport: 375x667
- Run method: local file or `python -m http.server 8080`

## Test 1 — Valid integer addition
**Preconditions:** Page loaded.

**Steps:**
1. Enter `2` in First number.
2. Enter `3` in Second number.
3. Click **Calculate**.

**Expected:**
- Result area shows `Sum: 5`.
- Error area is hidden.

## Test 2 — Recalculation without reload
**Preconditions:** Test 1 completed.

**Steps:**
1. Change First number to `10`.
2. Keep Second number as `3`.
3. Click **Calculate**.

**Expected:**
- Result updates to `Sum: 13`.
- No page reload occurs.

## Test 3 — Invalid text input
**Preconditions:** Page loaded.

**Steps:**
1. Enter `abc` in First number.
2. Enter `2` in Second number.
3. Click **Calculate**.

**Expected:**
- Error message: `Please enter valid numeric values in both fields.`
- Result is hidden.

## Test 4 — Recovery after validation error
**Preconditions:** Test 3 completed and error visible.

**Steps:**
1. Replace `abc` with `4`.
2. Click **Calculate**.

**Expected:**
- Error clears.
- Result appears: `Sum: 6`.

## Test 5 — Empty fields
**Preconditions:** Page loaded.

**Steps:**
1. Leave both fields empty.
2. Click **Calculate**.

**Expected:**
- Same validation error appears.
- No sum displayed.

## Test 6 — Decimal numbers
**Preconditions:** Page loaded.

**Steps:**
1. Enter `1.5` and `2.25`.
2. Click **Calculate**.

**Expected:**
- Result shows `Sum: 3.75`.

## Test 7 — Mobile responsiveness
**Preconditions:** Open browser devtools responsive mode (e.g., 375px width).

**Steps:**
1. Load page.
2. Interact with both input fields and button.

**Expected:**
- Inputs and button are fully visible and usable.
- Text is readable; no overlap/truncation of critical content.
