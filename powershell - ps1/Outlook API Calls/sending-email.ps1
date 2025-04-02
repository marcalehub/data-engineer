$tenantid = "Tenant ID"
$clientid = "Client ID"
$clientsecret = "Client Secret"

$body = @{
    grant_type = "client_credentials"
    client_id = $clientid
    client_secret = $clientsecret
    scope = "https://graph.microsoft.com/.default"
}

$tokenResponse = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantid/oauth2/v2.0/token" -Method POST -Body $body
$accessToken = $tokenResponse.access_token

$emailbody = @{
    message = @{
        subject = "Report Name"
        body = @{
            contentType = "Text"
            content = "Hello World"
        }
        toRecipients = @(
            @{
                emailAddress = @{
                    address = "Email Here"
                }
            }
        )
    }
} | ConvertTo-Json -Depth 10


$headers = @{
    "Authorization" = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/me/sendMail" -Method "POST" -Headers $headers -Body $emailbody