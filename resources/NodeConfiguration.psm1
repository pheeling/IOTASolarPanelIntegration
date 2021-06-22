function Get-NodeConfiguration(){
    return [NodeConfiguration]::new()
}

class NodeConfiguration {

    $nodeName = ""

    setNodeName($serverName){
        $this.servername = $servername
    }

    [String] getNodeName(){
        return $this.nodeName
    }
}
