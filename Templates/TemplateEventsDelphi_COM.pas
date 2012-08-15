//-----------------------------------------------------------------------------------------------------
//     This code was generated by the Wmi Delphi Code Creator (WDCC) Version [VERSIONAPP]
//     http://code.google.com/p/wmi-delphi-code-creator/
//     Blog http://theroadtodelphi.wordpress.com/wmi-delphi-code-creator/
//     Author Rodrigo Ruz V. (RRUZ) Copyright (C) 2011-2012 
//----------------------------------------------------------------------------------------------------- 
//
//     LIABILITY DISCLAIMER
//     THIS GENERATED CODE IS DISTRIBUTED "AS IS". NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.
//     YOU USE IT AT YOUR OWN RISK. THE AUTHOR NOT WILL BE LIABLE FOR DATA LOSS,
//     DAMAGES AND LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR MISUSING THIS CODE.
//
//----------------------------------------------------------------------------------------------------
program GetWMI_Info;

{$APPTYPE CONSOLE}

uses
  Windows,
  {$IF CompilerVersion > 18.5}
  Forms,
  {$IFEND}
  Variants,
  SysUtils,
  ActiveX,
  JwaWbemCli;

const
  //Impersonation Level Constants
  //http://msdn.microsoft.com/en-us/library/ms693790%28v=vs.85%29.aspx
  RPC_C_AUTHN_LEVEL_DEFAULT   = 0;
  RPC_C_IMP_LEVEL_ANONYMOUS   = 1;
  RPC_C_IMP_LEVEL_IDENTIFY    = 2;
  RPC_C_IMP_LEVEL_IMPERSONATE = 3;
  RPC_C_IMP_LEVEL_DELEGATE    = 4;

  //Authentication Service Constants
  //http://msdn.microsoft.com/en-us/library/ms692656%28v=vs.85%29.aspx
  RPC_C_AUTHN_WINNT      = 10;
  RPC_C_AUTHN_LEVEL_CALL = 3;
  RPC_C_AUTHN_DEFAULT    = $FFFFFFFF;
  EOAC_NONE              = 0;

  //Authorization Constants
  //http://msdn.microsoft.com/en-us/library/ms690276%28v=vs.85%29.aspx
  RPC_C_AUTHZ_NONE       = 0;
  RPC_C_AUTHZ_NAME       = 1;
  RPC_C_AUTHZ_DCE        = 2;
  RPC_C_AUTHZ_DEFAULT    = $FFFFFFFF;

  //Authentication-Level Constants
  //http://msdn.microsoft.com/en-us/library/aa373553%28v=vs.85%29.aspx  
  RPC_C_AUTHN_LEVEL_PKT_PRIVACY   = 6;

  SEC_WINNT_AUTH_IDENTITY_ANSI    = 1;
  SEC_WINNT_AUTH_IDENTITY_UNICODE = 2;
 
 //COAUTHIDENTITY Structure
 //http://msdn.microsoft.com/en-us/library/ms693358%28v=vs.85%29.aspx
 type
    PCOAUTHIDENTITY    = ^TCOAUTHIDENTITY;
    _COAUTHIDENTITY    = Record
                          User           : PChar;
                          UserLength     : ULONG;
                          Domain         : PChar;
                          DomainLength   : ULONG;
                          Password       : PChar;
                          PassWordLength : ULONG;
                          Flags          : ULONG;
                          End;

   COAUTHIDENTITY      = _COAUTHIDENTITY;
   TCOAUTHIDENTITY     = _COAUTHIDENTITY;
         
  TWmiEventSink = class(TInterfacedObject, IWbemObjectSink)
  public
    function Indicate(lObjectCount: Longint;  var apObjArray: IWbemClassObject): HRESULT; stdcall;
    function SetStatus(lFlags: Longint; hResult: HRESULT; strParam: WideString; pObjParam: IWbemClassObject): HRESULT; stdcall;
  end;
  
[HELPER_FUNCTIONS]


function TWmiEventSink.SetStatus(lFlags: Longint; hResult: HRESULT; strParam: WideString; pObjParam: IWbemClassObject): HRESULT; stdcall;
begin
  Result := WBEM_S_NO_ERROR;
end;

function TWmiEventSink.Indicate(lObjectCount: Longint; var apObjArray: IWbemClassObject): HRESULT; stdcall;
var
  Instance      : IWbemClassObject;
  pVal          : OleVariant;
  pType         : Integer;
  plFlavor      : Integer;
  lFlags        : Longint;
  sValue        : string;
begin
  Result := WBEM_S_NO_ERROR;
  lFlags :=0;

  if lObjectCount > 0 then
  begin
  
[DELPHIEVENTSOUT]	

    if Succeeded(apObjArray.Get('TargetInstance', lFlags, pVal, pType, plFlavor)) then
    begin      
      Instance := IUnknown(pVal) as IWbemClassObject;
      try
[DELPHIEVENTSOUT2]	
      finally
        Instance := nil;
      end;	  
    end;


  end;
end;  

  
//detect when a key was pressed in the console window
function KeyPressed:Boolean;
var
  lpNumberOfEvents     : DWORD;
  lpBuffer             : TInputRecord;
  lpNumberOfEventsRead : DWORD;
  nStdHandle           : THandle;
begin
  Result:=false;
  nStdHandle := GetStdHandle(STD_INPUT_HANDLE);
  lpNumberOfEvents:=0;
  GetNumberOfConsoleInputEvents(nStdHandle,lpNumberOfEvents);
  if lpNumberOfEvents<> 0 then
  begin
    PeekConsoleInput(nStdHandle,lpBuffer,1,lpNumberOfEventsRead);
    if lpNumberOfEventsRead <> 0 then
    begin
      if lpBuffer.EventType = KEY_EVENT then
      begin
        if lpBuffer.Event.KeyEvent.bKeyDown then
          Result:=true
        else
          FlushConsoleInputBuffer(nStdHandle);
      end
      else
      FlushConsoleInputBuffer(nStdHandle);
    end;
  end;
end;

procedure Test_IWbemServices_ExecNotificationQueryAsync;
const
  strLocale    = '';
  strUser      = '';
  strPassword  = '';
  strNetworkResource = '[WMINAMESPACE]';
  strAuthority       = '';
[DELPHIEVENTSWQL]
var
  FWbemLocator         : IWbemLocator;
  FWbemServices        : IWbemServices;
  FUnsecuredApartment  : IUnsecuredApartment;
  ppStub               : IUnknown;
  FWmiEventSink        : TWmiEventSink;
  StubSink             : IWbemObjectSink;

begin
  // Set general COM security levels --------------------------
  // Note: If you are using Windows 2000, you need to specify -
  // the default authentication credentials for a user by using
  // a SOLE_AUTHENTICATION_LIST structure in the pAuthList ----
  // parameter of CoInitializeSecurity ------------------------
  if Failed(CoInitializeSecurity(nil, -1, nil, nil, RPC_C_AUTHN_LEVEL_DEFAULT, RPC_C_IMP_LEVEL_IMPERSONATE, nil, EOAC_NONE, nil)) then Exit;
  // Obtain the initial locator to WMI -------------------------
  if Succeeded(CoCreateInstance(CLSID_WbemLocator, nil, CLSCTX_INPROC_SERVER, IID_IWbemLocator, FWbemLocator)) then
  try
    // Connect to WMI through the IWbemLocator::ConnectServer method
    if Succeeded(FWbemLocator.ConnectServer(strNetworkResource, strUser, strPassword, strLocale,  WBEM_FLAG_CONNECT_USE_MAX_WAIT, strAuthority, nil, FWbemServices)) then
    try
      // Set security levels on the proxy -------------------------
      if Failed(CoSetProxyBlanket(FWbemServices, RPC_C_AUTHN_WINNT, RPC_C_AUTHZ_NONE, nil, RPC_C_AUTHN_LEVEL_CALL, RPC_C_IMP_LEVEL_IMPERSONATE, nil, EOAC_NONE)) then Exit;
      if Succeeded(CoCreateInstance(CLSID_UnsecuredApartment, nil, CLSCTX_LOCAL_SERVER, IID_IUnsecuredApartment, FUnsecuredApartment)) then
      try
        FWmiEventSink := TWmiEventSink.Create;
        if Succeeded(FUnsecuredApartment.CreateObjectStub(FWmiEventSink, ppStub)) then
        try
          if Succeeded(ppStub.QueryInterface(IID_IWbemObjectSink, StubSink)) then
          try
            if Succeeded(FWbemServices.ExecNotificationQueryAsync('WQL', WQL, WBEM_FLAG_SEND_STATUS, nil, StubSink)) then
            begin
              Writeln('Listening events...Press any key to exit');
              //The next loop is only necessary in this sample console sample app
              //In VCL forms Apps you don't need use a loop
              while not KeyPressed do
              begin
                  {$IF CompilerVersion > 18.5}
                  Sleep(100);
                  Application.ProcessMessages;
                  {$IFEND}
              end;
              FWbemServices.CancelAsyncCall(StubSink);
            end;
          finally
            StubSink := nil;
          end;
        finally
          ppStub := nil;
        end;
      finally
        FUnsecuredApartment := nil;
      end;
    finally
      FWbemServices := nil;
    end;
  finally
    FWbemLocator := nil;
  end;
end;

begin
 try
  // Initialize COM
  if Succeeded(CoInitializeEx(nil, COINIT_MULTITHREADED)) then
  try
    Test_IWbemServices_ExecNotificationQueryAsync;
  finally
    CoUninitialize();
  end;
 except
    on E:Exception do
        Writeln(E.Classname, ':', E.Message);
 end;  
  Readln;
  
end.