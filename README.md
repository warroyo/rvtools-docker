# RVTools Docker

this repo builds a docker image to run RVTools. 

## USAGE

```pwsh
docker run -it --rm -v c:\<somedir>:c:\data -w c:\data warroyo90/rvtools 'rvtools -u $User -p $EncryptedPassword -s $VCServer -c ExportAll2xlsx -d c:\data -f vCenter1.xlsx  -DBColumnNames -ExcludeCustomAnnotations | Out-Null'
```

this will run the rvtools command against a vcenter and then output the xlsx file into a local volume mounted on the contaier.  the `| Out-Null` will force powershell to wait for the command to finish before exiting. rvtools does not log anything so if you dont see an output you may want to check the connection info.

## Example script

Rvtools packages an example powershell script you can find it in the container at `C:\Program Files (x86)\Robware\RVTools\RVToolsBatchMultipleVCs`

### Encrypted password 

you can use RVToolsPasswordEncryption.exe to encrypt your password