// Main JS File

function showPage(page_id) {
    // hide all divs
    document.querySelectorAll('div.dynamic').forEach(div => div.style.display = 'None')
    // show selected div (based on page_id)
    document.getElementById(page_id).style.display = 'block'
}

function redirect(url) {
    window.location.href = url
}