window.onload = () => {
  const ip = document.getElementById("ip");
  const copyBtn = document.getElementById("copy-btn");

  copyBtn.addEventListener('click', () => handleCopyBtn(ip, copyBtn));
}

const handleCopyBtn = async (ip, copyBtn) => {
  try {
    let inputEl = document.createElement("input");
    inputEl.setAttribute("readonly", true);
    inputEl.value = ip.textContent;
    copyBtn.appendChild(inputEl);
    inputEl.select();
    document.execCommand("copy");
    
    copyBtn.innerHTML = "Copied!";
    setTimeout(() => {
      copyBtn.innerHTML = "Copy";
    }, 3000);
  } catch (error) {
    console.error('Async: Could not copy text: ', error);
  }
}
