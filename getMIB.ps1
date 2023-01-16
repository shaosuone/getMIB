#set-executionpolicy remotesigned

# Libraries
Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Forms
try{
# Main Form 
$Form = New-Object System.Windows.Forms.Form
$Form.Text = ' DS-IT | SNMP MIB info'
$Form.Width = 1000
$Form.Height = 600
$Form.StartPosition = 'CenterScreen'
$Form.FormBorderStyle = 'FixedToolWindow'
$Form.BackColor = "#293541"

$ToolTip = New-Object System.Windows.Forms.ToolTip
$ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
$ToolTip.IsBalloon = $true

$LabelInput = New-Object System.Windows.Forms.Label
$LabelInput.Text = "Enter MIB/Key/OID:"
$LabelInput.Font = 'Microsoft Sans Serif, 8pt'
$LabelInput.Forecolor = 'LightGray'
$LabelInput.Location = New-Object System.Drawing.Point(10, 17)
$LabelInput.Autosize = $true
$LabelInput.FlatStyle = "Flat"
$Form.Controls.Add($LabelInput)

$TextBoxInput = New-Object System.Windows.Forms.Textbox
$TextBoxInput.Location = New-Object System.Drawing.Point(120, 15)
$TextBoxInput.Size = New-Object System.Drawing.Size(450, 50)
$TextBoxInput.BackColor = "#232027"
$TextBoxInput.Font = 'Microsoft Sans Serif, 8pt'
$TextBoxInput.Forecolor = 'LightGray'
    $ToolTip.SetToolTip($TextBoxInput, "Examples:`r`nIF-MIB`r`n1.3.6`r`n.1.3.6`r`nifName")
$Form.Controls.Add($TextBoxInput)

$LabelWc = New-Object System.Windows.Forms.Label
$LabelWc.Text = "Wildcards:"
$LabelWc.Location = New-Object System.Drawing.Point(575, 18)
$LabelWc.Autosize = $true
$LabelWc.Font = 'Microsoft Sans Serif, 8pt'
$LabelWc.Forecolor = 'LightGray'
$LabelWc.FlatStyle = "Flat"
$Form.Controls.Add($LabelWc)

$CheckBox = New-Object System.Windows.Forms.CheckBox
$CheckBox.Location       = New-Object System.Drawing.Point(635,18)
$CheckBox.Size = New-Object System.Drawing.Size(15, 15)
$CheckBox.FlatStyle = "Flat"
    $ToolTip.SetToolTip($CheckBox, "Search all text-containing results, not full-matched.")
$Form.Controls.Add($CheckBox)

$LabelRes = New-Object System.Windows.Forms.Label
$LabelRes.Text = "Results: -"
$LabelRes.Location = New-Object System.Drawing.Point(655, 18)
$LabelRes.Autosize = $true
$LabelRes.Font = 'Microsoft Sans Serif, 8pt'
$LabelRes.Forecolor = 'LightGray'
$LabelRes.FlatStyle = "Flat"
$Form.Controls.Add($LabelRes)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(750, 12)
$Button.Size = New-Object System.Drawing.Size(100, 25)
$Button.Text = 'Search'
$Button.Font = 'Microsoft Sans Serif, 8pt'
$Button.Forecolor = 'LightGray'
$Button.FlatStyle = "Flat"
    $ToolTip.SetToolTip($Button, "Press and wait result in the text field below")
$Form.Controls.Add($Button)

$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Point(860, 12)
$Button2.Size = New-Object System.Drawing.Size(100, 25)
$Button2.Text = 'Copy All'
$Button2.Font = 'Microsoft Sans Serif, 8pt'
$Button2.Forecolor = 'LightGray'
$Button2.FlatStyle = "Flat"
    $ToolTip.SetToolTip($Button2, "Copy all result to the clipboard")
$Form.Controls.Add($Button2)

# Result field
$MessageTextBox =  New-Object System.Windows.Forms.TextBox
$MessageTextBox.Location       = New-Object System.Drawing.Point(10,70)
$MessageTextBox.MinimumSize = "965,480"
$MessageTextBox.Multiline = $true
$MessageTextBox.ScrollBars = 'Vertical'
$MessageTextBox.BackColor = "#232027"
$MessageTextBox.Font = 'Microsoft Sans Serif, 10pt'
$MessageTextBox.Forecolor = 'LightGray'
    $ToolTip.SetToolTip($MessageTextBox, "Main info about SNMP MIB/Key/OID")

$LabelDDL = New-Object System.Windows.Forms.Label
$LabelDDL.Text = "Choose  MIBs  file :"
$LabelDDL.Location = New-Object System.Drawing.Point(10, 45)
$LabelDDL.Autosize = $true
$LabelDDL.Font = 'Microsoft Sans Serif, 8pt'
$LabelDDL.Forecolor = 'LightGray'
$LabelDDL.FlatStyle = "Flat"
$Form.Controls.Add($LabelDDL)

$DropDownList = New-Object System.Windows.Forms.ComboBox
$DropDownList.Width = '250'
$DropDownList.Location = New-Object System.Drawing.Point(120, 40)
$DropDownList.BackColor = "#232027"
$DropDownList.Font = 'Microsoft Sans Serif, 10pt'
$DropDownList.Forecolor = 'LightGray'
$DropDownList.FlatStyle = "Flat"
$Form.Controls.Add($DropDownList)

$ButtonLoad = New-Object System.Windows.Forms.Button
$ButtonLoad.Location = New-Object System.Drawing.Point(380, 40)
$ButtonLoad.Size = New-Object System.Drawing.Size(100, 25)
$ButtonLoad.Text = 'Load'
$ButtonLoad.Font = 'Microsoft Sans Serif, 8pt'
$ButtonLoad.Forecolor = 'LightGray'
$ButtonLoad.FlatStyle = "Flat"
    $ToolTip.SetToolTip($ButtonLoad, "Press and wait MIBs file loading")
$Form.Controls.Add($ButtonLoad)

$LinkLabel2 = New-Object System.Windows.Forms.LinkLabel
$LinkLabel2.Text = "GitHub"
$LinkLabel2.Location = New-Object System.Drawing.Point(490, 43)
$LinkLabel2.Autosize = $true
$LinkLabel2.Font = 'Microsoft Sans Serif, 12pt'
$LinkLabel2.LinkColor = "LightGray"
$LinkLabel2.ActiveLinkColor = "Gray"
$LinkLabel2.FlatStyle = "Flat"
$LinkLabel2.LinkBehavior = 'NeverUnderline'
$LinkLabel2.add_Click({[system.Diagnostics.Process]::start("https://github.com/Dmitry-Zh01")})
$Form.Controls.Add($LinkLabel2)

$LinkLabel3 = New-Object System.Windows.Forms.LinkLabel
$LinkLabel3.Text = "DockerHub"
$LinkLabel3.Location = New-Object System.Drawing.Point(560, 43)
$LinkLabel3.Autosize = $true
$LinkLabel3.Font = 'Microsoft Sans Serif, 12pt'
$LinkLabel3.LinkColor = "LightGray"
$LinkLabel3.ActiveLinkColor = "Gray"
$LinkLabel3.FlatStyle = "Flat"
$LinkLabel3.LinkBehavior = 'NeverUnderline'
$LinkLabel3.add_Click({[system.Diagnostics.Process]::start("https://hub.docker.com/search?q=dmitryzhdanov01")})
$Form.Controls.Add($LinkLabel3)

$LinkLabel4 = New-Object System.Windows.Forms.LinkLabel
$LinkLabel4.Text = "YouTube"
$LinkLabel4.Location = New-Object System.Drawing.Point(660, 43)
$LinkLabel4.Autosize = $true
$LinkLabel4.Font = 'Microsoft Sans Serif, 12pt'
$LinkLabel4.LinkColor = "LightGray"
$LinkLabel4.ActiveLinkColor = "Gray"
$LinkLabel4.FlatStyle = "Flat"
$LinkLabel4.LinkBehavior = 'NeverUnderline'
$LinkLabel4.add_Click({[system.Diagnostics.Process]::start("https://www.youtube.com/@ds-it2589/videos")})
$Form.Controls.Add($LinkLabel4)

}
catch{
    echo "Error while loading forms!!! Exception message is: "
    $PSItem.Exception.Message
}

$null = "" 

function getMIBs{
    $files = Get-ChildItem ".\*.json" | ForEach-Object{$DropDownList.Items.Add($_.Name)}
}


try{
    getMIBs
}
catch{
    $MessageTextBox.Text = "Error while loading MIBs list!!! Exception message is: " + $PSItem.Exception.Message
}

function getData{
    Get-Content $DropDownList.SelectedItem | ConvertFrom-Json
}


$ButtonLoad.Add_Click({
    If($DropDownList.SelectedItem -ne $null){
        try{
            getData
            $ButtonLoad.Text = 'Loaded ✔'
            $ButtonLoad.Font = "Microsoft Sans Serif, 8pt, style=Bold"
            $ButtonLoad.Forecolor = 'Black'
            $ButtonLoad.BackColor = "Green"
            $MessageTextBox.Text = $data
        }
        catch{
            $MessageTextBox.Text = "Error while loading data!!! Exception message is: " + $PSItem.Exception.Message
        }
    }
    Else{
        $MessageTextBox.Text = "Choose MIBs file before loading"
    }
})

$DropDownList.add_SelectedIndexChanged(
     { 
        $ButtonLoad.Text = "Load"
        $ButtonLoad.BackColor = "#232027"
        $ButtonLoad.Forecolor = 'LightGray'
        $ButtonLoad.Font = 'Microsoft Sans Serif, 8pt'
     }
)


$Button.Add_Click({
    $data = getData
    $MessageTextBox.Text = $null
    $Input = $TextBoxInput.Text
    If ($TextBoxInput.Text -match "\d\.+" -or $TextBoxInput.Text -match "\.\d\.+"){
        if ($CheckBox.Checked -ne $true){
            $result = $null
            $filteredData = $data | Where-Object OID -in "$Input"
            if ($filteredData -eq $null){
                
                $filteredData = $data | Where-Object OID -in $Input.TrimStart(".")
            }
            $resultCount = $filteredData.OID.Count
            try{
                if($filteredData.Count -ne 0 -or $filteredData.Count -ne 1){
                    foreach($x in $filteredData){
                        $result += "Name: " + [string]$x.Name + "`r`n" + "OID: " + [string]$x.OID + "`r`n" + "Type: " + [string]$x.Type + "`r`n" +  "Access: " + [string]$x.Access + "`r`n" + "MIB: " + [string]$x.MIB + "`r`n" +  "Description: " + [string]$x.Description + "`r`n" + "`r`n"
                    }
                }
                else{
                    $result = "Name: " + [string]$x.Name + "`r`n" + "OID: " + [string]$x.OID + "`r`n" + "Type: " + [string]$x.Type + "`r`n" +  "Access: " + [string]$x.Access + "`r`n" + "MIB: " + [string]$x.MIB + "`r`n" +  "Description: " + [string]$x.Description + "`r`n" + "`r`n"
                }
            }
            catch{
                $MessageTextBox.Text = "Error!!! Exception message is: " + $PSItem.Exception.Message
            }
        }
        elseif ($CheckBox.Checked -eq $true){
            $result = $null
            $filteredData = $data | Where-Object OID -like "$Input*"
            if ($filteredData -eq $null){
                $filteredData = $data | Where-Object OID -like ($Input.TrimStart("."))
            }
            $resultCount = $filteredData.OID.Count
            try{
                    foreach($z in $filteredData){
                        $OIDSearch += $z.OID + " || " + $z.Name + " || " + $z.Description + "`r`n" + "`r`n"
                    }
            }
            catch{
                $MessageTextBox.Text = "Error!!! Exception message is: " + $PSItem.Exception.Message
            }
            $result = "OIDs:" + "`r`n" + $OIDSearch
        }
        if ($resultCount -gt 0){
            $LabelRes.Text = "Results: " + $resultCount
            $MessageTextBox.Text = $result
        }
        else {
            $LabelRes.Text = "Results: -"
            $MessageTextBox.Text = "Unable to find coincidences"
        }
    }
    
    Elseif ($TextBoxInput.Text -match "\w+"){
        $error.clear()
        $MessageTextBox.Text = $null
        # MIB or Key?
        if ($data | Where-Object MIB -like "*$Input*"){    
            if ($CheckBox.Checked -ne $true){
                $filteredData = $data | Where-Object MIB -in $Input
                $resultCount = $filteredData.Count
                $result = $null
                try{
                    if($filteredData.Count -ne 0 -or $filteredData.Count -ne 1){
                        foreach($x in $filteredData){
                            $result += "Name: " + [string]$x.Name + "`r`n" + "OID: " + [string]$x.OID + "`r`n" + "Type: " + [string]$x.Type + "`r`n" +  "Access: " + [string]$x.Access + "`r`n" + "MIB: " + [string]$x.MIB + "`r`n" +  "Description: " + [string]$x.Description + "`r`n" + "`r`n"
                        }
                    }
                }
                catch{
                    $MessageTextBox.Text = "Error!!! Exception message is: " + $PSItem.Exception.Message
                }
            }
            elseif ($CheckBox.Checked -eq $true){
                $result = $null
                $filteredData = $data | Where-Object MIB -like "*$Input*"
                $filteredData = $filteredData.MIB | Sort-Object | Get-Unique
                $resultCount = $filteredData.Count
                try{
                    if($filteredData.Count -ne 0 -or $filteredData.Count -ne 1){
                        foreach($z in $filteredData){
                          $mibsSearch += $z + "`r`n"
                        }
                    }
                }
                catch{
                    $MessageTextBox.Text = "Error!!! Exception message is: " + $PSItem.Exception.Message
                }
                $result = "MIBs:" + "`r`n" + $mibsSearch
            }
            if ($resultCount -gt 0){
                $LabelRes.Text = "Results: " + $resultCount
                $MessageTextBox.Text = $result
            }
            else {
                $LabelRes.Text = "Results: -"
                $MessageTextBox.Text = "Unable to find coincidences"
            }
        }
        Elseif($data | Where-Object Name -like "*$Input*"){
            if ($CheckBox.Checked -ne $true){
                $filteredData = $data | Where-Object Name -in $Input
                $resultCount = $filteredData.Name.Count
                $result = $null
                try{
                    if($filteredData.Count -ne 0 -or $filteredData.Count -ne 1){
                        foreach($x in $filteredData){
                            $result += "Name: " + [string]$x.Name + "`r`n" + "OID: " + [string]$x.OID + "`r`n" + "Type: " + [string]$x.Type + "`r`n" +  "Access: " + [string]$x.Access + "`r`n" + "MIB: " + [string]$x.MIB + "`r`n" +  "Description: " + [string]$x.Description + "`r`n" + "`r`n"
                        }
                    }
                }
                catch{
                    $MessageTextBox.Text = "Error!!! Exception message is: " + $PSItem.Exception.Message
                }
            }
            elseif ($CheckBox.Checked -eq $true){
                $result = $null
                $filteredData = $data | Where-Object Name -like "*$Input*"
                $filteredData = $filteredData.Name | Sort-Object | Get-Unique
                $resultCount = $filteredData.Count
                try{
                    if($filteredData.Count -ne 0 -or $filteredData.Count -ne 1){
                        foreach($z in $filteredData){
                          $keySearch += $z + "`r`n"
                        }
                    }
                    else{
                        $keySearch = $filteredData
                    }

                }
                catch{
                    $MessageTextBox.Text = "Error!!! Exception message is: " + $PSItem.Exception.Message
                }
                $result = "Keys:" + "`r`n" + $keySearch
            }
            if ($resultCount -gt 0){
                $LabelRes.Text = "Results: " + $resultCount
                $MessageTextBox.Text = $result
            }
            else {
                $LabelRes.Text = "Results: -"
                $MessageTextBox.Text = "Unable to find coincidences"
            }
        }
    }
})
 
$Button2.Add_Click({
if($MessageTextBox.Text -ne $null){
    Set-Clipboard -Value $MessageTextBox.Text
    $TextBoxInput.Text = "All result data copied"
}
else{
    $TextBoxInput.Text = "Nothing to copy"
}
})

## Текстовые поля
$Form.Controls.Add($MessageTextBox)

## Заголовки полей
$Form.Controls.Add($MessageTextBoxLabel)

# Отображение формы
$Form.ShowDialog()