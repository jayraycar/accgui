unit main;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
    ExtCtrls, StdCtrls, ComCtrls, LMessages, constants, loginFrame;

type

    { TmainForm }

    TmainForm = class(TForm)
        userEdit: TEdit;
        Label1: TLabel;
        mainGroupBox: TGroupBox;
        MainMenu: TMainMenu;
        appMenuItem: TMenuItem;
        loginMenuItem: TMenuItem;
        logoutMenuItem: TMenuItem;
        exitMenuItem: TMenuItem;
        spacer1MenuItem: TMenuItem;
        quickButtonsPanel: TPanel;
        mainStatusBar: TStatusBar;
        procedure appMenuItemClick(Sender: TObject);
        procedure exitMenuItemClick(Sender: TObject);
        procedure loginMenuItemClick(Sender: TObject);
        procedure logoutMenuItemClick(Sender: TObject);
        procedure quickButtonsPanelClick(Sender: TObject);
    private
        server: string;
        port: string;
        urlStem: string;
        framePtr: pointer;

        // message handler for frames to message main form
        procedure frameFinished(var message: TLMessage);
        message LM_FRAME_MSG;

    public

    end;

var
    mainForm: TmainForm;

implementation

{$R *.lfm}

{ TmainForm }

procedure TmainForm.loginMenuItemClick(Sender: TObject);
begin
    // temporary - put this in an init subroutine
    server := 'localhost';
    port := '8080';
    mainStatusBar.SimpleText := 'Server: ' + server + ', Port: ' + port;
    urlStem := 'https://' + server + ':' + port + '/';

    // Login frame creation and initialisation
    freeAndNil(frameptr);
    mainGroupBox.caption := 'Login';

    framePtr := TLogin.Create(nil);
    TLogin(framePtr).Parent := mainGroupBox;
    TLogin(framePtr).Align := alClient;
    TLogin(framePtr).Visible := true;
    Tlogin(frameptr).ParentHandle := Handle;
    TLogin(framePtr).urlStem := urlStem;
    TLogin(framePtr).userEdit.setFocus;
end;

procedure TmainForm.appMenuItemClick(Sender: TObject);
begin

end;

procedure TmainForm.exitMenuItemClick(Sender: TObject);
begin
    halt;
end;

procedure TmainForm.logoutMenuItemClick(Sender: TObject);
begin

end;

procedure TmainForm.quickButtonsPanelClick(Sender: TObject);
begin

end;

{
    frames send a message when they are finished
    all processing of data related to a frame must
    be dealt with by the frame.
    Data may be retrieved from the frame if necessary before destruction
}
procedure TmainForm.frameFinished(var message: TLMessage);
begin
    case message.wParam of
        FR_LOGIN:
            begin
               userEdit.Text := Tlogin(framePtr).userEdit.Text;
               freeAndNil(framePtr);
               mainGroupBox.Caption := 'Logged in';
            end;
    end;
end;

end.

