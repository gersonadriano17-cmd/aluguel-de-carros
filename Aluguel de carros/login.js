const loginForm = document.getElementById('loginForm');
const password = document.getElementById('password');
const showPassword = document.getElementById('showPassword');
const loginMessage = document.getElementById('loginMessage');

showPassword.addEventListener('click', () => {
    const showing = password.type === 'text';
    password.type = showing ? 'password' : 'text';
    showPassword.textContent = showing ? '👁' : '🙈';
});

loginForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const email = document.getElementById('email').value.trim();
    const senha = password.value.trim();

    if (!email || !senha) {
        showMessage('Preencha o e-mail e a senha.', 'error');
        return;
    }

    // Login visual para o projeto.
    // A autenticação real pode ser ligada a um banco/backend depois.
    sessionStorage.setItem('fp_usuario_logado', 'true');
    sessionStorage.setItem('fp_usuario_email', email);

    showMessage('Login realizado! Entrando...', 'success');
    document.querySelector('.login-page').classList.add('going-home');

    setTimeout(() => {
        window.location.href = 'index.html';
    }, 550);
});

document.getElementById('forgotPassword').addEventListener('click', (event) => {
    event.preventDefault();
    showMessage('A recuperação de senha será adicionada posteriormente.', 'error');
});

document.getElementById('registerLink').addEventListener('click', (event) => {
    event.preventDefault();
    showMessage('A criação de conta será adicionada posteriormente.', 'error');
});

function showMessage(message, type) {
    loginMessage.textContent = message;
    loginMessage.className = `login-message ${type}`;
}
