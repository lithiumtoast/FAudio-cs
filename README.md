# FAudio-cs

Automatically updated C# bindings for https://github.com/FNA-XNA/FAudio with native dynamic link libraries.

## How to use

### From source

1. Download and install [.NET 6](https://dotnet.microsoft.com/download).
2. Fork the repository using GitHub or clone the repository manually with submodules: `git clone --recurse-submodules https://github.com/bottlenoselabs/FAudio-cs`.
3. Build the native library by running `library.sh`. To execute `.sh` scripts on Windows, use Git Bash which can be installed with Git itself: https://git-scm.com/download/win. The `library.sh` script requires that CMake is installed and in your path.
4. Import the MSBuild `FAudio.props` file which is located in the root of this directory to your `.csproj` file to setup everything you need.
```xml
<!-- FAudio: bindings + native library -->
<Import Project="$([System.IO.Path]::GetFullPath('path/to/FAudio.props'))" />
```

#### Bindgen

If you wish to re-generate the bindings, run [`c2cs`](https://github.com/lithiumtoast/c2cs) from this directory.

## Developers: Documentation

For more information on how C# bindings work, see [`C2CS`](https://github.com/lithiumtoast/c2cs), the tool that generates the bindings for `FAudio` and other C libraries.

FNA3D has limited support.

## License

`FAudio-cs` is licensed under the MIT license (`MIT`) - see the [LICENSE file](LICENSE) for details.

`FAudio` itself is licensed under the ZLib license (`zlib`) - see https://github.com/FNA-XNA/FAudio/blob/master/LICENSE for more details.
