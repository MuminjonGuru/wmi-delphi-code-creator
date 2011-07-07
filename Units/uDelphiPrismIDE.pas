{**************************************************************************************************}
{                                                                                                  }
{ Unit uDelphiPrismIDE                                                                             }
{ Unit for the WMI Delphi Code Creator                                                             }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is uDelphiPrismIDE.pas.                                                        }
{                                                                                                  }
{ The Initial Developer of the Original Code is Rodrigo Ruz V.                                     }
{ Portions created by Rodrigo Ruz V. are Copyright (C) 2011 Rodrigo Ruz V.                         }
{ All Rights Reserved.                                                                             }
{                                                                                                  }
{**************************************************************************************************}

unit uDelphiPrismIDE;

interface

Uses
  Classes;


function IsDelphiPrismInstalled: boolean;
function GetDelphiPrismCompilerFileName: string;
function GetDelphiPrismCompilerFolder: string;

function IsMonoDevelopInstalled: boolean;
function IsDelphiPrismAttachedtoMonoDevelop: boolean;
function GetMonoDevelopIDEFileName: string;

function IsVS2008Installed: boolean;
function IsDelphiPrismAttachedtoVS2008: boolean;
function GetVS2008IDEFileName: string;

function IsVS2010Installed: boolean;
function IsDelphiPrismAttachedtoVS2010: boolean;
function GetVS2010IDEFileName: string;

procedure CompileAndRunOxygenCode(Console:TStrings;const CompilerName, ProjectFile: string;
  Run: boolean);

implementation

uses
  Windows,
  ShellAPI,
  uRegistry,
  SysUtils, uMisc;

const
  //HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\RemObjects\Oxygene
  DelphiPrismx86RegEntry = '\Software\RemObjects\Oxygene';
  DelphiPrismx64RegEntry = '\Software\Wow6432Node\RemObjects\Oxygene';
  VS2010x64RegEntry      = '\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\Setup\VS';
  VS2010x86RegEntry      = '\SOFTWARE\Microsoft\VisualStudio\10.0\Setup\VS';
  VS2008x64RegEntry      = '\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\9.0\Setup\VS';
  VS2008x86RegEntry      = '\SOFTWARE\Microsoft\VisualStudio\9.0\Setup\VS';

  DelphiPrismVS2008x64 =
    '\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\9.0\InstalledProducts\RemObjects Oxygene';
  DelphiPrismVS2008x86 =
    '\SOFTWARE\Microsoft\VisualStudio\9.0\InstalledProducts\RemObjects Oxygene';
  DelphiPrismVS2010x64 =
    '\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\InstalledProducts\RemObjects Oxygene';
  DelphiPrismVS2010x86 =
    '\SOFTWARE\Microsoft\VisualStudio\10.0\InstalledProducts\RemObjects Oxygene';

  //HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Novell\MonoDevelop
  MonoDevelopx64RegEntry = '\SOFTWARE\Novell\MonoDevelop';
  MonoDevelopx86RegEntry = '\SOFTWARE\Wow6432Node\Novell\MonoDevelop';


procedure CompileAndRunOxygenCode(Console:TStrings;const CompilerName, ProjectFile: string;
  Run: boolean);
var
  ExeFile: string;
begin
  Console.Add('');
  CaptureConsoleOutput(Format('"%s" "%s"', [CompilerName,ProjectFile]), Console);
  if Run then
  begin
    ExeFile := ExtractFilePath(ProjectFile) + 'bin\release\' + ChangeFileExt(ExtractFileName(ProjectFile), '.exe');
    if FileExists(ExeFile) then
      ShellExecute(0, nil, PChar(Format('"%s"',[ExeFile])), nil, nil, SW_SHOWNORMAL)
    else
      MsgWarning(Format('Could not find %s', [ExeFile]));
  end;
end;


function IsWow64: boolean;
type
  TIsWow64Process = function(Handle: Windows.THandle;
      var Res: Windows.BOOL): Windows.BOOL; stdcall;
var
  IsWow64Result:  Windows.BOOL;
  IsWow64Process: TIsWow64Process;
begin
  IsWow64Process := Windows.GetProcAddress(Windows.GetModuleHandle('kernel32.dll'),
    'IsWow64Process');
  if Assigned(IsWow64Process) then
  begin
    if not IsWow64Process(Windows.GetCurrentProcess, IsWow64Result) then
      Result := False
    else
      Result := IsWow64Result;
  end
  else
    Result := False;
end;

function IsMonoDevelopInstalled: boolean;
var
  Value: string;
begin
  Result := False;
  if IsWow64 then
  begin
    if RegKeyExists(MonoDevelopx64RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(MonoDevelopx64RegEntry, 'Path', Value, HKEY_LOCAL_MACHINE);
      Value  := IncludeTrailingPathDelimiter(Value) + 'bin\Monodevelop.exe';
      Result := FileExists(Value);
    end;
  end
  else
  begin
    if RegKeyExists(MonoDevelopx86RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(MonoDevelopx86RegEntry, 'Path', Value, HKEY_LOCAL_MACHINE);
      Value  := IncludeTrailingPathDelimiter(Value) + 'bin\Monodevelop.exe';
      Result := FileExists(Value);
    end;
  end;
end;


function GetMonoDevelopIDEFileName: string;
begin
  Result := '';
  if IsWow64 then
  begin
    if RegKeyExists(MonoDevelopx64RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(MonoDevelopx64RegEntry, 'Path', Result, HKEY_LOCAL_MACHINE);
      Result := IncludeTrailingPathDelimiter(Result) + 'bin\Monodevelop.exe';
    end;
  end
  else
  begin
    if RegKeyExists(MonoDevelopx86RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(MonoDevelopx86RegEntry, 'Path', Result, HKEY_LOCAL_MACHINE);
      Result := IncludeTrailingPathDelimiter(Result) + 'bin\Monodevelop.exe';
    end;
  end;
end;

function IsDelphiPrismAttachedtoMonoDevelop: boolean;
var
  Value: string;
begin
  Result := False;
  if IsWow64 then
  begin
    if RegKeyExists(MonoDevelopx64RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(MonoDevelopx64RegEntry, 'Path', Value, HKEY_LOCAL_MACHINE);
      Value  := IncludeTrailingPathDelimiter(Value) +
        'AddIns\Oxygene\RemObjects.Oxygene.Compiler.dll';
      Result := FileExists(Value);
    end;
  end
  else
  begin
    if RegKeyExists(MonoDevelopx86RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(MonoDevelopx86RegEntry, 'Path', Value, HKEY_LOCAL_MACHINE);
      Value  := IncludeTrailingPathDelimiter(Value) +
        'AddIns\Oxygene\RemObjects.Oxygene.Compiler.dll';
      Result := FileExists(Value);
    end;
  end;
end;


function IsVS2008Installed: boolean;
var
  Value: string;
begin
  Result := False;
  if IsWow64 then
  begin
    if RegKeyExists(VS2008x64RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(VS2008x64RegEntry, 'EnvironmentPath', Value, HKEY_LOCAL_MACHINE);
      Result := FileExists(Value);
    end;
  end
  else
  begin
    if RegKeyExists(VS2008x86RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(VS2008x86RegEntry, 'EnvironmentPath', Value, HKEY_LOCAL_MACHINE);
      Result := FileExists(Value);
    end;
  end;
end;

function IsDelphiPrismAttachedtoVS2008: boolean;
begin
  if IsWow64 then
    Result := RegKeyExists(DelphiPrismVS2008x64, HKEY_LOCAL_MACHINE)
  else
    Result := RegKeyExists(DelphiPrismVS2008x86, HKEY_LOCAL_MACHINE);
end;

function IsDelphiPrismAttachedtoVS2010: boolean;
begin
  if IsWow64 then
    Result := RegKeyExists(DelphiPrismVS2010x64, HKEY_LOCAL_MACHINE)
  else
    Result := RegKeyExists(DelphiPrismVS2010x86, HKEY_LOCAL_MACHINE);
end;

function GetVS2008IDEFileName: string;
begin
  Result := '';
  if IsWow64 then
  begin
    if RegKeyExists(VS2008x64RegEntry, HKEY_LOCAL_MACHINE) then
      RegReadStr(VS2008x64RegEntry, 'EnvironmentPath', Result, HKEY_LOCAL_MACHINE);
  end
  else
  begin
    if RegKeyExists(VS2008x86RegEntry, HKEY_LOCAL_MACHINE) then
      RegReadStr(VS2008x86RegEntry, 'EnvironmentPath', Result, HKEY_LOCAL_MACHINE);
  end;
end;

function GetVS2010IDEFileName: string;
begin
  Result := '';
  if IsWow64 then
  begin
    if RegKeyExists(VS2010x64RegEntry, HKEY_LOCAL_MACHINE) then
      RegReadStr(VS2010x64RegEntry, 'EnvironmentPath', Result, HKEY_LOCAL_MACHINE);
  end
  else
  begin
    if RegKeyExists(VS2010x86RegEntry, HKEY_LOCAL_MACHINE) then
      RegReadStr(VS2010x86RegEntry, 'EnvironmentPath', Result, HKEY_LOCAL_MACHINE);
  end;
end;

function IsVS2010Installed: boolean;
var
  Value: string;
begin
  Result := False;
  if IsWow64 then
  begin
    if RegKeyExists(VS2010x64RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(VS2010x64RegEntry, 'EnvironmentPath', Value, HKEY_LOCAL_MACHINE);
      Result := FileExists(Value);
    end;
  end
  else
  begin
    if RegKeyExists(VS2010x86RegEntry, HKEY_LOCAL_MACHINE) then
    begin
      RegReadStr(VS2010x86RegEntry, 'EnvironmentPath', Value, HKEY_LOCAL_MACHINE);
      Result := FileExists(Value);
    end;
  end;
end;

function GetDelphiPrismRegValue(const Value: string): string;
begin
  if IsWow64 then
  begin
    if RegKeyExists(DelphiPrismx64RegEntry, HKEY_LOCAL_MACHINE) then
      RegReadStr(DelphiPrismx64RegEntry, Value, Result, HKEY_LOCAL_MACHINE);
  end
  else
  begin
    if RegKeyExists(DelphiPrismx86RegEntry, HKEY_LOCAL_MACHINE) then
      RegReadStr(DelphiPrismx86RegEntry, Value, Result, HKEY_LOCAL_MACHINE);
  end;
end;

function GetDelphiPrismCompilerFolder: string;
begin
  Result := IncludeTrailingPathDelimiter(GetDelphiPrismRegValue('InstallDir')) + 'Bin';
end;

function GetDelphiPrismCompilerFileName: string;
begin
  Result := Format('%s%s', [IncludeTrailingPathDelimiter(GetDelphiPrismCompilerFolder),
    'oxygene.exe']);
end;

function IsDelphiPrismInstalled: boolean;
begin
  Result := FileExists(GetDelphiPrismCompilerFileName) and
    (GetDelphiPrismRegValue('Installed') = '1');
end;

end.
