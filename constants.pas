unit constants;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, LMessages;

const
    // message identification number
    LM_FRAME_MSG = LM_USER + 1;

    // WParam
    FR_LOGIN = 1; // Login frame
    FR_PATIENT = 2;
    FR_REQUEST = 3;
    FR_ACCOUNTS = 4;

    // LParam
    NO_VALUE = 0;

implementation

end.

