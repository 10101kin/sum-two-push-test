(function () {
  const form = document.getElementById('sum-form');
  const inputA = document.getElementById('value-a');
  const inputB = document.getElementById('value-b');
  const resultMessage = document.getElementById('result-message');
  const errorMessage = document.getElementById('error-message');

  function resetFeedback() {
    errorMessage.hidden = true;
    errorMessage.textContent = '';
    resultMessage.hidden = true;
    resultMessage.textContent = '';
  }

  function showError(message) {
    resultMessage.hidden = true;
    resultMessage.textContent = '';
    errorMessage.textContent = message;
    errorMessage.hidden = false;
  }

  function showResult(sum) {
    errorMessage.hidden = true;
    errorMessage.textContent = '';
    resultMessage.textContent = `Sum: ${sum}`;
    resultMessage.hidden = false;
  }

  function parseNumber(raw) {
    const trimmed = raw.trim();
    if (trimmed === '') {
      return { ok: false, value: null };
    }

    const value = Number(trimmed);
    if (!Number.isFinite(value)) {
      return { ok: false, value: null };
    }

    return { ok: true, value };
  }

  form.addEventListener('submit', function (event) {
    event.preventDefault();

    const parsedA = parseNumber(inputA.value);
    const parsedB = parseNumber(inputB.value);

    if (!parsedA.ok || !parsedB.ok) {
      showError('Please enter valid numeric values in both fields.');
      return;
    }

    const sum = parsedA.value + parsedB.value;
    showResult(sum);
  });

  inputA.addEventListener('input', resetFeedback);
  inputB.addEventListener('input', resetFeedback);
})();
