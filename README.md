Bu projenin amaci Docker,Kubernetes,CI/CD ve security basliklarinda aldigimiz egitimleri uygulama imkani olusturmaktir.

myapp  uygulamasi  Python Flask ile yazilmistir.  Arka planda MYSQL database'ine baglanarak query sonucunu web sayfasinda göstermektedir.

mydb uygulamasi mysql database uygulamasidir. 

myapp uygulamasinin calisabilmesi icin  

1- mysql kurulu olmasi gerekir. Docker hub'dan latest mysql imajı kullanilabilir.
2- mysql uzerinde init.sql scriptinin birkez calistirilmasi gerekir
3- myapp üzerine database connection konfigürasyonunun doğru olması gerekir.


Client-> Browser (http://NodePort_IP:NodePort) <-> Kubernetes Proxy <-> MYAPP_POD<->MYDB_POD

Output: {"buyuk_sehirler": [["Istanbul", "34"], ["Ankara", "06"]]}


Projeyi Kubernetes üzerinde çalıştırmadan önce Docker olarak çalıştırın.  

Docker container1:  myapp
Docker container2:  mydb

---------------

Myapp icin Dockerfile asagidaki alanlari icermelidir. 

FROM python:3.6
EXPOSE <PORT GIRIN>
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY app.py /app
CMD python app.py

-----------------

Mydb POD'u terminate olduğunda verilerin ve konfigürasyonun silinmemesi gerekir. 
HFHGFX
boiljob deneme
hgfh
gfdgrfdrgd
 jhfgjlkjhblkjuhyk
