Get-Volume | Sort-Object -Property Size | ConvertTo-Html |Out-File -FilePath C:\disksize.html
$From = "caglayuzlek@gmail.com"
$To = "caglayuzlek@gmail.com"
$Attachment = "C:\disksize.html"
$Subject = "disk boyutu"
$Body = "disk boyutu html sayfası ektedir."
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential (Get-Credential) -Attachments $Attachment