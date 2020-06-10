foreach($ddc in $ConfigurationData.Citrix.VDA.DeliveryController){
    XD7VDAController "$ddc" {
        Name = $ddc
    }
}
XOSSCtxOptimizationRegistry "XOSSCtxReg" {}
        
XOSSCtxOptimizationScheduledTask "XOSSCtxTasks"{}

XOSSCtxOptimizationService "XOSSCtxServices"{}

