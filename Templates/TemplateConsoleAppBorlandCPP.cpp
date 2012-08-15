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
#pragma hdrstop
#include <iostream>
using namespace std;
#include <wbemcli.h>
#include <comdef.h> 

//CREDENTIAL structure
//http://msdn.microsoft.com/en-us/library/windows/desktop/aa374788%28v=vs.85%29.aspx
#define CRED_MAX_USERNAME_LENGTH            513
#define CRED_MAX_CREDENTIAL_BLOB_SIZE       512
#define CREDUI_MAX_USERNAME_LENGTH CRED_MAX_USERNAME_LENGTH
#define CREDUI_MAX_PASSWORD_LENGTH (CRED_MAX_CREDENTIAL_BLOB_SIZE / 2)

[WMICLASSDESC]
#pragma argsused
int main(int argc, char* argv[])
{
	wchar_t pszName[CREDUI_MAX_USERNAME_LENGTH+1] = L"user";
	wchar_t pszPwd[CREDUI_MAX_PASSWORD_LENGTH+1]  = L"password";
	BSTR strNetworkResource;
	//To use a WMI remote connection set localconn to false and configure the values of the pszName, pszPwd and the name of the remote machine in strNetworkResource
	bool localconn = true;	
	strNetworkResource = localconn ?  L"\\\\.\\[WMINAMESPACE]" : L"\\\\remote--machine\\[WMINAMESPACE]";

	COAUTHIDENTITY *userAcct =  NULL ;
	COAUTHIDENTITY authIdent;

	// Initialize COM. ------------------------------------------

	HRESULT hres;
	hres =  CoInitializeEx(0, COINIT_MULTITHREADED);
	if (FAILED(hres))
	{
        cout << "Failed to initialize COM library. Error code = 0x"	<< hex << hres << endl;
        cout << _com_error(hres).ErrorMessage() << endl;
        cout << "press enter to exit" << endl;
        cin.get();		
        return 1;                  // Program has failed.
	}

	// Set general COM security levels --------------------------

	if (localconn)
		hres =  CoInitializeSecurity(
			NULL,
			-1,                          // COM authentication
			NULL,                        // Authentication services
			NULL,                        // Reserved
			RPC_C_AUTHN_LEVEL_DEFAULT,   // Default authentication
			RPC_C_IMP_LEVEL_IMPERSONATE, // Default Impersonation
			NULL,                        // Authentication info
			EOAC_NONE,                   // Additional capabilities
			NULL                         // Reserved
			);
	else
		hres =  CoInitializeSecurity(
			NULL,
			-1,                          // COM authentication
			NULL,                        // Authentication services
			NULL,                        // Reserved
			RPC_C_AUTHN_LEVEL_DEFAULT,   // Default authentication
			RPC_C_IMP_LEVEL_IDENTIFY,    // Default Impersonation
			NULL,                        // Authentication info
			EOAC_NONE,                   // Additional capabilities
			NULL                         // Reserved
			);
			
	if (FAILED(hres))
	{
        cout << "Failed to initialize security. Error code = 0x" << hex << hres << endl;
        cout << _com_error(hres).ErrorMessage() << endl;
        CoUninitialize();
		cout << "press enter to exit" << endl;
	    cin.get();		
        return 1;                    // Program has failed.
	}

	// Obtain the initial locator to WMI -------------------------

	IWbemLocator *pLoc = NULL;
	hres = CoCreateInstance(CLSID_WbemLocator, 0, CLSCTX_INPROC_SERVER, IID_IWbemLocator, (LPVOID *) &pLoc);

	if (FAILED(hres))
	{
        cout << "Failed to create IWbemLocator object."	<< " Err code = 0x" << hex << hres << endl;
        cout << _com_error(hres).ErrorMessage() << endl;
        CoUninitialize();	    
        cout << "press enter to exit" << endl;
		cin.get();		
        return 1;                 // Program has failed.
	}

	// Connect to WMI through the IWbemLocator::ConnectServer method

	IWbemServices *pSvc = NULL;

	if (localconn)	
		hres = pLoc->ConnectServer(
			 strNetworkResource,      // Object path of WMI namespace
			 NULL,                    // User name. NULL = current user
			 NULL,                    // User password. NULL = current
			 0,                       // Locale. NULL indicates current
			 NULL,                    // Security flags.
			 0,                       // Authority (e.g. Kerberos)
			 0,                       // Context object
			 &pSvc                    // pointer to IWbemServices proxy
			 );
	else
		hres = pLoc->ConnectServer(
			strNetworkResource,  // Object path of WMI namespace
			pszName,             // User name
			pszPwd,              // User password
			NULL,                // Locale
			NULL,                // Security flags
			NULL,				 // Authority
			NULL,                // Context object
			&pSvc                // IWbemServices proxy
			);

	if (FAILED(hres))
	{
        cout << "Could not connect. Error code = 0x" << hex << hres << endl;	
        cout << _com_error(hres).ErrorMessage() << endl;
        pLoc->Release();
        CoUninitialize();
	    cout << "press enter to exit" << endl;
	    cin.get();			
        return 1;                // Program has failed.
	}

	cout << "Connected to [WMINAMESPACE] WMI namespace" << endl;

    // Set security levels on the proxy -------------------------
	if (localconn)
		hres = CoSetProxyBlanket(
		   pSvc,                        // Indicates the proxy to set
		   RPC_C_AUTHN_WINNT,           // RPC_C_AUTHN_xxx
		   RPC_C_AUTHZ_NONE,            // RPC_C_AUTHZ_xxx
		   NULL,                        // Server principal name
		   RPC_C_AUTHN_LEVEL_CALL,      // RPC_C_AUTHN_LEVEL_xxx
		   RPC_C_IMP_LEVEL_IMPERSONATE, // RPC_C_IMP_LEVEL_xxx
		   NULL,                        // client identity
		   EOAC_NONE                    // proxy capabilities
		);
	else
	{
		// Create COAUTHIDENTITY that can be used for setting security on proxy
		memset(&authIdent, 0, sizeof(COAUTHIDENTITY));
		authIdent.PasswordLength = wcslen (pszPwd);
		authIdent.Password = (USHORT*)pszPwd;
		authIdent.User = (USHORT*)pszName;
		authIdent.UserLength = wcslen(pszName);
		authIdent.Domain = 0;
		authIdent.DomainLength = 0;
		authIdent.Flags = SEC_WINNT_AUTH_IDENTITY_UNICODE;
		userAcct = &authIdent;

		hres = CoSetProxyBlanket(
		   pSvc,                           // Indicates the proxy to set
		   RPC_C_AUTHN_DEFAULT,            // RPC_C_AUTHN_xxx
		   RPC_C_AUTHZ_DEFAULT,            // RPC_C_AUTHZ_xxx
		   COLE_DEFAULT_PRINCIPAL,         // Server principal name
		   RPC_C_AUTHN_LEVEL_PKT_PRIVACY,  // RPC_C_AUTHN_LEVEL_xxx
		   RPC_C_IMP_LEVEL_IMPERSONATE,    // RPC_C_IMP_LEVEL_xxx
		   userAcct,                       // client identity
		   EOAC_NONE                       // proxy capabilities
		);
	}

	if (FAILED(hres))
	{
        cout << "Could not set proxy blanket. Error code = 0x" << hex << hres << endl;
		cout << _com_error(hres).ErrorMessage() << endl;
		pSvc->Release();
		pLoc->Release();
		CoUninitialize();
		cout << "press enter to exit" << endl;
		cin.get();		
		return 1;               // Program has failed.
	}

	// Use the IWbemServices pointer to make requests of WMI ----

	IEnumWbemClassObject* pEnumerator = NULL;
	hres = pSvc->ExecQuery(	L"WQL",	L"SELECT * FROM [WMICLASSNAME]",
	WBEM_FLAG_FORWARD_ONLY | WBEM_FLAG_RETURN_IMMEDIATELY, NULL, &pEnumerator);

	if (FAILED(hres))
	{
		cout << "ExecQuery failed" << " Error code = 0x"	<< hex << hres << endl;
		cout << _com_error(hres).ErrorMessage() << endl;
		pSvc->Release();
		pLoc->Release();
		CoUninitialize();
		cout << "press enter to exit" << endl;
		cin.get();		
		return 1;               // Program has failed.
	}
    
	// Secure the enumerator proxy
	if (!localconn)
	{
		
		hres = CoSetProxyBlanket(
			pEnumerator,                    // Indicates the proxy to set
			RPC_C_AUTHN_DEFAULT,            // RPC_C_AUTHN_xxx
			RPC_C_AUTHZ_DEFAULT,            // RPC_C_AUTHZ_xxx
			COLE_DEFAULT_PRINCIPAL,         // Server principal name
			RPC_C_AUTHN_LEVEL_PKT_PRIVACY,  // RPC_C_AUTHN_LEVEL_xxx
			RPC_C_IMP_LEVEL_IMPERSONATE,    // RPC_C_IMP_LEVEL_xxx
			userAcct,                       // client identity
			EOAC_NONE                       // proxy capabilities
			);

		if (FAILED(hres))
		{
			cout << "Could not set proxy blanket on enumerator. Error code = 0x" << hex << hres << endl;
			cout << _com_error(hres).ErrorMessage() << endl;
			pEnumerator->Release();
			pSvc->Release();
			pLoc->Release();
			CoUninitialize();
			cout << "press enter to exit" << endl;
			cin.get();				
			return 1;               // Program has failed.
		}
	}

	// Get the data from the WQL sentence
	IWbemClassObject *pclsObj = NULL;
	ULONG uReturn = 0;

	while (pEnumerator)
	{
		HRESULT hr = pEnumerator->Next(WBEM_INFINITE, 1, &pclsObj, &uReturn);

		if(0 == uReturn || FAILED(hr))
		  break;

		VARIANT vtProp;

[CPPCODE]		
		pclsObj->Release();
		pclsObj=NULL;
	}

	// Cleanup

	pSvc->Release();
	pLoc->Release();
	pEnumerator->Release();
	if (pclsObj!=NULL)
	 pclsObj->Release();

	CoUninitialize();
	cout << "press enter to exit" << endl;
	cin.get();
	return 0;   // Program successfully completed.
}
