#This Script will manage the store communication via script deployment.

$AptosUsername = "$DeviceName\posluser"
$AptosPassword = "Y0uThC10Th3$"


Function BroadcastMenu {
    param ( [string]$Title = " " )

    Clear-Host
    Write-Host "=============== $Title ================="
    Write-Host "1 -> Single Register"
    Write-Host "2 -> All Registers in single store" 
    Write-Host "3 -> .CSV list of registers"
    Write-Host "4 -> All Registers within specific brand"
    Write-Host "5 -> ALL STORES"
    Write-Host "Q: Press Q to Quit"
    Write-Host "====================================================="
}
 
Function Opt1 {
    "Broadcasting Pop-Up message to a single Store"
        $Option1Host = Read-Host "Please Enter Register name in STORE0000-REG00 format"  
        "Computer information"
        Test-NetConnection -ComputerName $Option1Host
}

Function Opt1Delivery {
    # PsExec \\$Option1Host -u $AptosUsername -p $AptosPassword msg 
    Write-host "$Option1Message delivered to $Option1Host!" -ForegroundColor Green

}

Function Opt4Delivery {
    # PsExec \\$Option1Host -u $AptosUsername -p $AptosPassword msg 
    Write-host "$Option1Message delivered to selected Brand" -ForegroundColor Green

}

Function BrandSelMenu {
    param ( [string]$Title2 = " " )

    Write-Host "1 -> Gymboree"
    Write-Host "2 -> Crazy8"
    Write-Host "3 -> Janie Jack"
    Write-Host "4 -> Gymboree Outlet" 
    Write-Host "Q -> Quit"
}
BroadcastMenu -Title "Broadcast to Stores"
$ReadSelection = Read-Host "Please Select Broadcast Scope [1-4] or Q to quit" 

switch ($ReadSelection){

   '1' { 
       Opt1
        $Option1ComputerValidation = Read-Host "Is this the correct machine you wish to broadcast this message? Y/N"
         switch ($Option1ComputerValidation) {
          "Y" {
               $Option1Message = Read-Host "Enter Message to be Broadcasted"
              } "N" {
                 Opt1      
                    }
                } 
        " "
        Opt1Delivery
        pause

    } "2" {

        "This Feature is not yet Enabled" 
        return

    } '3' {

        "This Feature is not yet Enabled"

    } '4' {
        BrandSelMenu
        $BrandSelection = Read-Host "Please choose brand"
            switch ($BrandSelection) {
                '1' {
                   $Opt4GymboreeMsg = Read-Host "Enter Message to be Delivered"
                   Write-Host "Message: $Opt4GymboreeMsg" 
                   $Opt4GymboreeMsgConfirm = Read-Host "Do you want to send this message? Y/N"
                    switch ($Opt4GymboreeMsgConfirm) {
                        'y' {
                            Write-host "$Opt4GymboreeMsg Delivered to all GYMBOREE Stores" -ForegroundColor Green
                        } 'n' {
                            return
                        }
                    }
                            
                        
                } '2' {
                    Write-Host "Crazy 8"
                } '3' {
                    Write-Host "Janie and Jack"
                } '4' {
                    Write-Host "Gymboree Outlet"
                } 'q' {
                    Return
                }
            }

    } '5' {

        $AllStoreWarning = Read-Host "WARNING: THIS WILL BROADCAST YOUR MESSAGE TO EVERY STORE, Do you wish to Continue? Y/N"
            Switch ($AllStoreWarning) {
                "Y" {
                    $Option1Message = Read-Host "Enter Message to be Broadcasted" 
              } "N" {
                    return
                    }
            }
        Write-Host "$Option1Message Sent to ALL STORES!" -ForegroundColor Green
        pause

    } "Q" {
        return
    }

}



pause


