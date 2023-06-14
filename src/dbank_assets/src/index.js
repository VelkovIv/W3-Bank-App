import {dbank} from '../../declarations/dbank';

window.addEventListener('load', async () => {
  update();
});

document.querySelector('form').addEventListener('submit', async (event) => {
  event.preventDefault();

  const button = document.getElementById('submit-btn');

  const inputAmount = parseFloat(document.getElementById('input-amount').value);
  const withdrawAmount = parseFloat(document.getElementById('withdrawal-amount').value);

  button.setAttribute('disabled', true);

  if (document.getElementById('input-amount').value.lenght != 0) {
    await dbank.topUp(inputAmount);
  }
  if (document.getElementById('withdrawal-amount').value.lenght != 0) {
    await dbank.withdrawl(withdrawAmount);
  }

  await dbank.compaound();
  
  update();

  document.getElementById('input-amount').value = '';
  document.getElementById('withdrawal-amount').value = '';
  button.removeAttribute('disabled')

});

async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById('value').innerHTML = currentAmount.toFixed(2);
}