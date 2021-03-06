# TBB DevOps Uzmanı Yetiştirme Programı Bitirme Çalışması 

Bitirme projesinde bir Flask uygulaması önce dockerize edildi sonrasında kubernetes kullanılarak deploy edildi. CI/CD yönetimi Jenkins ile yapıldı. Active Directory kullanılarak DNS Server kurulumu yapıldı, nodeportların ve haproxynin kayıtları girildi. Haproxy kullanılarak trafik load balancer seviyesinde yönetildi. 

## Jenkins
Jenkins pipeline'ı build job kullanılarak trigger edildi. Her github commit ile triggerlanması için _Build Triggers_'ın _GitHub hook trigger for GITScm polling_ seçeneği kullanıldı. Ngrok aracı kullanılarak jenkins local ip'sinin internete çıkmasını sağlanıldı. 

![buildjob](./images/webhook.PNG)

![buildjob](./images/webhook2.PNG)

Böylece her commit sonrasında SonarQube ile statik kod analizi yapıldı, docker ile build alınıp yeni imaj oluşturuldu ve oluşturulan imaj kubernetese deploy edildi. Test ve prod deploymentlarında manual onay alındı. 

![sonarqubeanalysis](./images/sonarqube.PNG)
![jenkinstest](./images/jenkinstest.png)
![jenkinsprod](./images/jenkinsprod.png)


## Monitoring
Monitoring için zabbix ve grafana kullanıldı. DNS Server makinesi için windows agent, HAProxy ve Jenkins makineleri içinse Linux Agent kullanıldı. Sistem ve URL monitoring yapıldı.
- System Monitoring
![grafana](./images/grafana1.PNG)

- URL Monitoring
![grafana](./images/grafana2.PNG)

Ngrok komutları için: https://github.com/jenkins-x/jx/issues/5633#issuecomment-578161537
