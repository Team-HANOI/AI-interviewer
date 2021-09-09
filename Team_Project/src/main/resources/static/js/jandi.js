// Add squares

const squares = document.querySelector('.squares');
for (var i = 1; i < 365; i++) {
  const level = Math.floor(Math.random() * 3);  
  var arr = "${intArr}";
  console.log(arr[i]);
  squares.insertAdjacentHTML('beforeend', `<li data-level="${level}" type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="zzz"></li>`);
}