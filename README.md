Hello, everyone. This Powershell + Windows Forms small application allows us to lookup SNMP MIB JSON files.<br>
Search options: 
- MIB data (MIB, Key, OID, Data Type, Access, Description)
- MIBs list (search with "Wildcards" checkbox option helps to find all MIBs included to data file, which contains keyword, for example: "<strong>Cisco</strong>")
- Key data (MIB, Key, OID, Data Type, Access, Description)
- Keys list (search with "Wildcards" checkbox option helps to find all keys included to data file, which contains keyword, for example: "<strong>ifName</strong>")
- OID data (MIB, Key, OID, Data Type, Access, Description)
- OID list (search with "Wildcards" checkbox option helps to find all OIDs subnumbers included to data file, for example, if input: "1.3.6.1.4.1.9.10.28.1", the following result will be obtained:<br> 
<strong>1.3.6.1.4.1.9.10.28.1 || cisco5800HealthMonObjects ||<br> 
1.3.6.1.4.1.9.10.28.1.1 || ciscoHealthMonStatusTable || The table of status maintained by the health monitor.<br> 
1.3.6.1.4.1.9.10.28.1.1.1 || ciscoHealthMonStatusEntry || An entry in the status table, containing the information about the status of the health monitoring setup commands<...><br> 
</strong>

<strong>YouTube demo video</strong>:<br>
<a href="https://youtu.be/1I53Hc3eJLw">How to use getMIB SNMP Info | PowerShell / SNMP / Zabbix / JSON</a>

How to?<br>
To launch apllication you should run this via link: "<strong>getMIB - Launch</strong>" or run script file "<strong>getMIB.ps1</strong>" from PS terminal / ISE.

I have added only one JSON file with MIBs info, which consists of 50000 data items due to lack of opportunity to upload here large files.
In order to use full base of SNMP MIBs/OIDs/Keys, you may download JSON files (divided by the first MIBs letter) via the following link and copy these files into the folder with script:<br>
<a href="https://drive.google.com/drive/folders/187mqe_kZIRVr9MkTfDol6OD2X5Z5u8lo?usp=sharing">MIB json files on Google Drive</a>

<strong>Important</strong><br>
I have collected 8 large JSON MIBs base files consist of <strong>more than 15 thousands of MIB files and more than 1.6 millions of items</strong>!
Unfortunately, when I have tried to use these files, I observed that the application works too slow. 
So, I recommend to split files into smaller parts, which will consist of required for you job MIBs items, and use it with convient performance.

Have a nice day :)
