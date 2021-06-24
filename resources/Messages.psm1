function Get-Messages(){
    return [Messages]::new()
}

class Messages {

    $hostname = "api.lb-0.testnet.chrysalis2.com"

    getMessage($identifier){

    }

    [PSCustomObject]sendMessage($message,$apiCommand){
        $url = "https://$($this.hostname)/$apiCommand"
        return Invoke-WebRequest -Uri $url -Method "POST"
    }

    validateIdenxationKey($idenxationKey){
        
    }

}
