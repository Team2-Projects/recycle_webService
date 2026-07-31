async function apiFetch(url, method = "GET", data = null) {
    const options = {
        method: method,
        headers: {
            "Content-Type": "application/json"
        }
    };

    if (data !== null) {
        options.body = JSON.stringify(data);
    }

    const response = await fetch(url, options);

    if (!response.ok) {
        throw new Error(`HTTP Error : ${response.status}`);
    }

    // 응답이 없는 경우(204 No Content 등)
    const contentType = response.headers.get("content-type");
    if (!contentType || !contentType.includes("application/json")) {
        return null;
    }

    return await response.json();
}

function formatDate(date, { years = 0, months = 0, days = 0 } = {}) {
    const newDate = new Date(date);

    newDate.setFullYear(newDate.getFullYear() + years);
    newDate.setMonth(newDate.getMonth() + months);
    newDate.setDate(newDate.getDate() + days);

    const yyyy = newDate.getFullYear();
    const mm = String(newDate.getMonth() + 1).padStart(2, '0');
    const dd = String(newDate.getDate()).padStart(2, '0');

    return `${yyyy}-${mm}-${dd}`;
}