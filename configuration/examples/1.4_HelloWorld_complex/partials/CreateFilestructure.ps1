File "HelloWorld" {                                      # Resourcenblock
    Ensure = "Present"
    DestinationPath = $Node.DestinationPath
    Contents = $Node.Content
    Force = $true
}