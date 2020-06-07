Configuration W2K16_1607_ActiveSetup
{
     # DOTNETFRAMEWORKS
     Registry "89B4C1CD-B018-4511-B0A1-5476DBF70820"
     {
         Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
         ValueName = "{89B4C1CD-B018-4511-B0A1-5476DBF70820}"
         Ensure = "Absent"
     }

     # DOTNETFRAMEWORKS
     Registry "89B4C1CD-B018-4511-B0A1-5476DBF70820"
     {
         Key = "HKLM\SOFTWARE\WOW6432Node\Microsoft\Active Setup\Installed Components\"
         ValueName = "{89B4C1CD-B018-4511-B0A1-5476DBF70820}"
         Ensure = "Absent"
     }
   
     # Microsoft Internet Explorer Initializer Setup
     Registry "89820200-ECBD-11cf-8B85-00AA005B4383"
     {
         Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
         ValueName = "{89820200-ECBD-11cf-8B85-00AA005B4383}"
         Ensure = "Absent"
     }
   
     # Microsoft Outlook MailNews Express Setup
     Registry "44BBA840-CC51-11CF-AAFA-00AA00B6015C"
     {
         Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
         ValueName = "{44BBA840-CC51-11CF-AAFA-00AA00B6015C}"
         Ensure = "Absent"
     }

     # Microsoft Outlook MailNews Express Setup -x64
     Registry "44BBA840-CC51-11CF-AAFA-00AA00B6015C"
     {
         Key = "HKLM\SOFTWARE\WOW6432Node\Microsoft\Active Setup\Installed Components\"
         ValueName = "{44BBA840-CC51-11CF-AAFA-00AA00B6015C}"
         Ensure = "Absent"
     }
   
     # Themes Setup
     Registry "2C7339CF-2B09-4501-B3F3-F3508C9228ED"
     {
           Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
           ValueName = "{2C7339CF-2B09-4501-B3F3-F3508C9228ED}"
           Ensure = "Absent"
     }
   
     # Windows Desktop Update Setup
     Registry "89820200-ECBD-11cf-8B85-00AA005B4340"
     {
         Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
         ValueName = "{89820200-ECBD-11cf-8B85-00AA005B4340}"
         Ensure = "Absent"
     }

     # Windows Windows Media Player
     Registry "6BF52A52-394A-11d3-B153-00C04F79FAA6"
     {
         Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
         ValueName = "{6BF52A52-394A-11d3-B153-00C04F79FAA6}"
         Ensure = "Absent"
     }

     # Web Platform Customizations
     Registry "89820200-ECBD-11cf-8B85-00AA005B4383"
     {
         Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
         ValueName = "{89820200-ECBD-11cf-8B85-00AA005B4383}"
         Ensure = "Absent"
     }

     # Windows Media Player
     Registry "22d6f312-b0f6-11d0-94ab-0080c74c7e95"
     {
         Key = "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\"
         ValueName = "{22d6f312-b0f6-11d0-94ab-0080c74c7e95}"
         Ensure = "Absent"
     }

     # Windows Media Player -x64
     Registry "22d6f312-b0f6-11d0-94ab-0080c74c7e95"
     {
         Key = "HKLM\SOFTWARE\WOW6432Node\Microsoft\Active Setup\Installed Components\"
         ValueName = "{22d6f312-b0f6-11d0-94ab-0080c74c7e95}"
         Ensure = "Absent"
     }

     # IE ESC for Admins
     Registry "A509B1A8-37EF-4b3f-8CFC-4F3A74704073"
     {
         Key = "HKLM\SOFTWARE\WOW6432Node\Microsoft\Active Setup\Installed Components\"
         ValueName = "{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
         Ensure = "Absent"
     }

     # IE ESC for Users
     Registry "A509B1A8-37EF-4b3f-8CFC-4F3A74704073"
     {
         Key = "HKLM\SOFTWARE\WOW6432Node\Microsoft\Active Setup\Installed Components\"
         ValueName = "{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
         Ensure = "Absent"
     }

     # StubPath
     Registry "2D46B6DC-2207-486B-B523-A557E6D54B47"
     {
         Key = "HKLM\SOFTWARE\WOW6432Node\Microsoft\Active Setup\Installed Components\"
         ValueName = "{2D46B6DC-2207-486B-B523-A557E6D54B47}"
         Ensure = "Absent"
     }
}
