#RVTools Docker

this repo builds a docker image to run RVTools.

## USAGE

```pwsh
docker run -it --rm -v c:\<somedir>:c:\data warroyo90/rvtools rvtools -u $User -p $EncryptedPassword -s $VCServer -c ExportAll2xlsx -d c:\data -f vCenter1.xlsx  -DBColumnNames -ExcludeCustomAnnotations
```

this will run the rvtools command against a vcenter and then output the xlsx file into a local volume mounted on the contaier. 