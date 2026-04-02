<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Undangan Pernikahan</title>

<style>
body {
  margin: 0;
  font-family: 'Segoe UI', sans-serif;
  background: linear-gradient(to bottom, #fff0f5, #ffe4e1);
  text-align: center;
}

/* halaman awal */
#awal {
  padding: 60px;
}

button {
  padding: 12px 25px;
  font-size: 18px;
  border-radius: 10px;
  border: none;
  background: #b76e79;
  color: white;
}

/* isi */
#isi {
  display: none;
  padding: 40px;
  animation: fade 1.5s;
}

.nama {
  font-size: 28px;
  margin: 20px;
  font-weight: bold;
}

#countdown {
  font-size: 40px;
  margin-top: 20px;
}

/* prank */
#prank {
  display: none;
  font-size: 35px;
  color: red;
  padding: 50px;
  animation: shake 0.3s infinite;
}

/* animasi */
@keyframes fade {
  from {opacity: 0;}
  to {opacity: 1;}
}

@keyframes shake {
  0% { transform: translate(3px, 3px); }
  25% { transform: translate(-3px, -3px); }
  50% { transform: translate(3px, -3px); }
  75% { transform: translate(-3px, 3px); }
  100% { transform: translate(3px, 3px); }
}
</style>
</head>

<body>

<div id="awal">
  <h2>💌 UNDANGAN SPESIAL 💌</h2>
  <p>Kepada Yth:</p>
  <h3 id="target"></h3>
  <p>Kami mengundang Anda untuk menghadiri acara penting.</p>
  <button onclick="buka()">Buka Undangan</button>
</div>

<div id="isi">
  <h2>Undangan Pernikahan</h2>
  <p>Dengan penuh kebahagiaan kami mengundang Anda ke pernikahan:</p>

  <div class="nama">ARIF & LADUSING</div>

  <p>Acara akan segera dimulai dalam:</p>
  <div id="countdown">5</div>
</div>

<div id="prank">
  😂 SELAMAT ANDA KENA PRANK 😂  
  <br><br>
  Udah serius amat bacanya 🤣
</div>

<script>
// ambil nama dari link (?to=Nama)
const params = new URLSearchParams(window.location.search);
const nama = params.get("to") || "Tamu Undangan";

document.getElementById("target").innerText = nama;

function buka(){
  document.getElementById("awal").style.display = "none";
  document.getElementById("isi").style.display = "block";

  let waktu = 5;
  let cd = document.getElementById("countdown");

  let timer = setInterval(() => {
    waktu--;
    cd.innerHTML = waktu;

    if(waktu <= 0){
      clearInterval(timer);
      document.getElementById("isi").style.display = "none";
      document.getElementById("prank").style.display = "block";
      document.body.style.background = "black";
    }
  }, 1000);
}
</script>

</body>
</html>
