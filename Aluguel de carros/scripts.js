let prevbutton = document.getElementById('prev')
let nextbutton = document.getElementById('next')
let container = document.querySelector('.container')
let items = container.querySelectorAll('.List .item')
let indicator = document.querySelector('.indicators')
let dots = indicator.querySelectorAll('ul li')
let List = container.querySelector('.List')

let active = 0
let firstPosition = 0
let lastPosition = items.length - 1

item = 0
item = 1
item = 2
item = 3



nextbutton.onclick = () => {
    List.style.setProperty('--calculation', 1)
    let itemOld = container.querySelector('.List .item.active')
    itemOld.classList.remove('active')

    active = active + 1 > lastPosition ? 0 : active + 1
    items[active].classList.add('active')

    let dotsOld = indicator.querySelector('ul li.active')
    dotsOld.classList.remove('active')
    dots[active].classList.add('active')

    indicator.querySelector('.number').innerText = '0' + (active + 1)

}


prevbutton.onclick = () => {
    List.style.setProperty('--calculation', -1)

    let itemOld = container.querySelector('.List .item.active')
    itemOld.classList.remove('active')

    active = active - 1 < firstPosition ? lastPosition : active - 1
    items[active].classList.add('active')

    let dotsOld = indicator.querySelector('ul li.active')
    dotsOld.classList.remove('active')
    dots[active].classList.add('active')

    indicator.querySelector('.number').innerText = '0' + (active + 1)

}

/* ============================================================
   CURTIDAS E SALVAMENTO (localStorage, sem login)
   ============================================================ */

const LIKES_KEY = 'fp_like_counts'   // { carId: numero }
const LIKED_KEY = 'fp_liked_cars'    // [carId, carId, ...] -> já curtidos neste navegador
const SAVED_KEY = 'fp_saved_cars'    // [carId, carId, ...] -> salvos neste navegador

function readList(key) {
    try {
        return JSON.parse(localStorage.getItem(key)) || []
    } catch (e) {
        return []
    }
}

function readCounts() {
    try {
        return JSON.parse(localStorage.getItem(LIKES_KEY)) || {}
    } catch (e) {
        return {}
    }
}

function writeList(key, list) {
    localStorage.setItem(key, JSON.stringify(list))
}

function writeCounts(counts) {
    localStorage.setItem(LIKES_KEY, JSON.stringify(counts))
}

function toggleLike(carId) {
    const liked = readList(LIKED_KEY)
    const counts = readCounts()
    const idx = liked.indexOf(carId)

    if (idx === -1) {
        liked.push(carId)
        counts[carId] = (counts[carId] || 0) + 1
    } else {
        liked.splice(idx, 1)
        counts[carId] = Math.max((counts[carId] || 1) - 1, 0)
    }

    writeList(LIKED_KEY, liked)
    writeCounts(counts)
    renderCarState(carId)
}

function toggleSave(carId) {
    const saved = readList(SAVED_KEY)
    const idx = saved.indexOf(carId)

    if (idx === -1) {
        saved.push(carId)
    } else {
        saved.splice(idx, 1)
    }

    writeList(SAVED_KEY, saved)
    renderCarState(carId)
    renderSavedCounter()
    if (!savedOverlay.classList.contains('hidden')) {
        renderSavedList()
    }
}

function renderCarState(carId) {
    const item = container.querySelector(`.item[data-car-id="${carId}"]`)
    if (!item) return

    const liked = readList(LIKED_KEY).includes(carId)
    const counts = readCounts()

    const likeBtn = item.querySelector('.like-button')
    const likeIcon = item.querySelector('.like-icon')
    const likeCount = item.querySelector('.like-count')
    likeBtn.classList.toggle('liked', liked)
    likeIcon.textContent = liked ? '♥' : '♡'
    likeCount.textContent = counts[carId] || 0

    const saved = readList(SAVED_KEY).includes(carId)
    item.querySelector('.save-button').classList.toggle('saved', saved)
}

function renderAllCarStates() {
    items.forEach(item => renderCarState(item.dataset.carId))
}

container.addEventListener('click', (e) => {
    const likeBtn = e.target.closest('.like-button')
    const saveBtn = e.target.closest('.save-button')

    if (likeBtn) {
        toggleLike(likeBtn.closest('.item').dataset.carId)
    }
    if (saveBtn) {
        toggleSave(saveBtn.closest('.item').dataset.carId)
    }
})

/* ------------------------------------------------------------
   PAINEL "MEUS SALVOS"
------------------------------------------------------------ */

const savedOpen = document.getElementById('savedOpen')
const savedOverlay = document.getElementById('savedOverlay')
const savedClose = document.getElementById('savedClose')
const savedList = document.getElementById('savedList')
const savedCounter = document.getElementById('savedCounter')

function getCarInfo(carId) {
    const item = container.querySelector(`.item[data-car-id="${carId}"]`)
    if (!item) return null
    return {
        id: carId,
        name: item.querySelector('h2').innerText.trim(),
        img: item.querySelector('.car-img .img').getAttribute('src')
    }
}

function renderSavedList() {
    const carIds = readList(SAVED_KEY)

    if (carIds.length === 0) {
        savedList.innerHTML = '<p class="saved-empty">Você ainda não salvou nenhum carro.</p>'
        return
    }

    savedList.innerHTML = ''
    carIds.forEach(carId => {
        const car = getCarInfo(carId)
        if (!car) return

        const row = document.createElement('div')
        row.className = 'saved-item'
        row.innerHTML = `
            <img src="${car.img}" alt="${car.name}">
            <span class="saved-item-name">${car.name}</span>
            <button class="saved-remove" data-car-id="${car.id}">Remover</button>
        `
        savedList.appendChild(row)
    })
}

function renderSavedCounter() {
    savedCounter.textContent = readList(SAVED_KEY).length
}

savedOpen.onclick = () => {
    renderSavedList()
    savedOverlay.classList.remove('hidden')
}

savedClose.onclick = () => {
    savedOverlay.classList.add('hidden')
}

savedOverlay.onclick = (e) => {
    if (e.target === savedOverlay) {
        savedOverlay.classList.add('hidden')
    }
}

savedList.addEventListener('click', (e) => {
    const removeBtn = e.target.closest('.saved-remove')
    if (removeBtn) {
        toggleSave(removeBtn.dataset.carId)
    }
})

/* ------------------------------------------------------------
   INICIALIZAÇÃO
------------------------------------------------------------ */

renderAllCarStates()
renderSavedCounter()