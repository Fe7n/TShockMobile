# TShockMobile

 Compileable version of TShock compatible with mobile
 
[User Docs](https://tshock.readme.io/docs/getting-started)


## Build Instructions:

- **Open MSBuildPath.txt**

*Make sure the path to MSBuild.exe is correct or the setup will fail*

> <a href="https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16">Click here if you don't have MSBuild.exe</a>

- **Run setup.bat**

*You may now enter one of the following commands:*

```srv```
> "Builds TerrariaServerAPI (deletes any prior build)"

```shk``` 
> "Builds TShockAPI (deletes any prior build)"

```rls``` 
> "Clean up files and creates a Release in \MobileServer (deletes any prior Release)

```all``` 
> "Executes all the above commands, in order!"

```exit``` 
> "Closes setup"

- **Enjoy!**

## Build Instructions (Legacy):
1. Open and build, TShock.4.OTAPI.sln
2. Open and build, TShock.sln
3. Go to TShockAPI\bin\Debug
4. Run TerrariaServer.exe to create the ServerPlugins folder
5. Copy and paste TShockAPI.dll into \ServerPlugins
6. Done!

(might need to replace the OTAPI= referenced in TShockAPI with the same OTAPI referenced by TerrariaServerAPI)
