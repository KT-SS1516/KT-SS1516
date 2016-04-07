% symb: Symbole
% p: auftrittswahrscheinlichkeiten
function sfd=shannonfanodict(symb,p)
% Auftrittswahrscheinlichkeiten absteigend sortierten
[p_sorted,sort_index]=sort(p,'descend');
% Shannon Fano Codes
codes_sf=shannonfano(p_sorted);
% Codes in urspr�ngliche Reihenfolge bringen
c_sf(sort_index)=codes_sf;
% W�rterbuch entsprechend Huffman-Codierung: Cell-Array mit
% - Symbolnummern in erster Spalte
% - bin�re Codew�rter (bin�re Arrays) in zweiter Spalte
sfd=[num2cell(symb(1:end)') c_sf'];

function code=shannonfano(p)
% p: Vektor mit absteigend sortierten Wahrscheinlichkeiten
if length(p)==1
    code={[]}; % nur ein Zeichen, keine Codierung notwendig
elseif length(p)==2
    code={1;0}; % zwei Zeichen, Codierung mit 0 und 1
else % mindestens drei Zeichen
    % Vektor normieren
    p=p/sum(p);
    % "0"-H�lfte bis zu dem Index, so dass die aufsummierten
    % Wahrscheinlichkeiten am n�chsten bei 0.5 liegen
    [dev0,I]=min(abs(cumsum(p)-0.5));
    % Indizes der "0"-H�lfte
    Izero=1:I;
    %  Indizes der "1" H�lfte
    Ione=(I+1):length(p);
    % Rekursive Codierung der oberen und unteren H�lfte
    Czero=shannonfano(p(Izero));
    Cone=shannonfano(p(Ione));
    % "0" bzw. "1" vorne anf�gen
    for i=1:length(Czero)
        Czero{i}=[0 Czero{i}];
    end
    for i=1:length(Cone)
        Cone{i}=[1 Cone{i}];
    end
    % H�lften zusammensetzen
    code=[Czero;Cone];
end
            
