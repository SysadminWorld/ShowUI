New-Grid -Columns 2 {            
    New-TextBlock -Margin 10 -TextWrapping Wrap -ZIndex 1 -HorizontalAlignment Left -FontWeight Bold -FontSize 12 -DataBinding @{            
        "Text" = "LastProgress.Activity"            
    }            
    New-TextBlock -Margin 10 -ZIndex 1 -TextWrapping Wrap -Column 1 -VerticalAlignment Bottom -HorizontalAlignment Right -FontStyle Italic -FontSize 12 -DataBinding @{            
        "Text" = "LastProgress.StatusDescription"            
    }            
    New-ProgressBar -ColumnSpan 2 -MinHeight 250 -Name ProgressPercent -DataBinding @{            
        "Value" = "LastProgress.PercentComplete"            
    }            
} -On_Loaded {            
    Invoke-Background -control $this -ScriptBlock {             
        param($step = 1, $sleep = 50)
        for ($i =1; $i -lt 100; $i+=$step) {            
            Write-Progress "MajorProgress" "MinorProgress" -PercentComplete $i 
            Start-Sleep -Milliseconds $sleep
        }
        Write-Progress "All" "Done" -Completed            
    } -parameter @{
        Step = 2
        Sleep = 100
    }            
} -show
