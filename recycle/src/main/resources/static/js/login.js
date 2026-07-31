let goJoinPage = () => {
    location.href = "/pages/join.html";
}

let goLoginPage = () => {
    location.href = "/index.html";
}

async function join() {
    alert("join 시작");
    const member = {
        id: document.querySelector("#id").value,
        password: document.querySelector("#password").value,
        name: document.querySelector("#name").value
    };

    try {
        await apiFetch("/join", "POST", member);

        alert("회원가입 완료");
        location.href = "/login";
    } catch (e) {
        alert("회원가입 실패");
        console.error(e);
    }
}
