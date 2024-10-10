let randomNumber = Math.floor(Math.random() * 20) + 1
let score = 0
let highScore = 20
let guessHistory = []


const displayMessage = function (message) {
    document.querySelector('.message').textContent = message;
};

const updateGuessHistory = function () {
    document.querySelector('.guess-history').textContent = `Guesses: ${guessHistory.join(', ')}`;
}

document.querySelector('.check').addEventListener('click', function () {
    const guess = Number(document.querySelector('.guess').value);

    if (!guess) {
        displayMessage("No number :(");
    } else if (guess < 1 || guess > 20) {
        displayMessage("Please enter a number between 1 and 20 :)")
    } else if (guess === randomNumber) {
        displayMessage("Correct number :)")
        document.querySelector('.number').textContent = randomNumber;
        document.querySelector('.guess').value = '';

        if (score < highScore) {
            highScore = score;
            document.querySelector(".highscore").textContent = highScore;
        }
    } else if (guess > randomNumber) {
        displayMessage("Too high :(")
        score++
        document.querySelector('.score').textContent = score;
        document.querySelector('.guess').value = '';
        guessHistory.push(guess);
        updateGuessHistory();
    } else if (guess < randomNumber) {
        displayMessage("Too low :(")
        score++
        document.querySelector('.score').textContent = score;
        document.querySelector('.guess').value = '';
        guessHistory.push(guess);
        updateGuessHistory();

    }
})

document.querySelector(".again").addEventListener('click', function () {
    score = 0;
    highScore = 20;
    randomNumber = Math.floor(Math.random() * 20) + 1
    guessHistory = []
    displayMessage('Start guessing...')
    document.querySelector('.score').textContent = score;
    document.querySelector('.highscore').textContent = highScore;
    document.querySelector('.number').textContent = '?';
    document.querySelector('.guess').value = '';
    updateGuessHistory();

})
