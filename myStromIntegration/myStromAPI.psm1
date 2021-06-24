function Get-MyStrom(){
    return [MyStrom]::new()
}

class MyStrom {

    $hostName

    [PSCustomObject]getData($hostName,$apiCommand){
        $url = "http://$hostname/$apiCommand"
        return $this.convertContentToObject((Invoke-WebRequest -Uri $url -Method "GET"),$apiCommand)
    }

    [PSCustomObject] convertContentToObject($response, $apiCommand){

        switch ($apiCommand) {
            "report" {
                $1,$2,$3,$4,$5,$6,$7,$8,$9,$10 = $response.content.Split("{").Split("}").Split(",").split(":").Trim('"')
                $item = New-Object -TypeName pscustomobject
                $item | add-member -Type NoteProperty -Name $2 -Value $3
                $item | add-member -Type NoteProperty -Name $4 -Value $5
                $item | add-member -Type NoteProperty -Name $6 -Value $7
                $item | add-member -Type NoteProperty -Name $8 -Value $9
                return $item
            }
            default {
                return $response.Content
            }
        }
        return $null
    }
}