
use DB_2022_07_08

alter table VIAGGIO
add constraint vincolo1
unique(STAZIONEPARTENZA, DATAORAPARTENZA, BINARIOPARTENZA)



SELECT T.CODT
FROM TRENO T
JOIN VIAGGIO V ON V.CODT=T.CODT
WHERE V.STAZIONEARRIVO='LIV'
and day(v.DATAORAARRIVO)=1 


SELECT T.TIPO
FROM TRENO T
WHERE T.CODT NOT IN ( SELECT V.CODT
						FROM VIAGGIO V
						WHERE V.STAZIONEPARTENZA='OLB')



---Selezionare,  per ogni tipo di treno,
---il codice della stazione di partenza per la quale
---sono presenti il maggior numero di biglietti.


select s.cods, t.tipo
from stazione s
join VIAGGIO v on v.STAZIONEPARTENZA=s.CODS
join treno t on t.CODT=v.CODT
join BIGLIETTO b on b.CODT=v.CODT
group by s.CODS, t.TIPO
having count(b.CODB) >= ALL (
								select count(b.CODB)
								from stazione s
								join VIAGGIO v on v.STAZIONEPARTENZA=s.CODS
								join treno t on t.CODT=v.CODT
								join BIGLIETTO b on b.CODT=v.CODT
								group by s.CODS, t.TIPO)



Per ogni tipo di treno e per ogni citta di stazione,
riportare (1) il numero di viaggi
(fatti con quel tipo di treno e che arrivano in quella citta)
e (2) la capienza media dei treni in tali viaggi



select count(v.codt) as numero_di_viaggi,
avg(t.capienza) as capienza_media,
t.TIPO, s.citta
from VIAGGIO v
join TRENO t on v.CODT=t.CODT
join STAZIONE s on s.CODS=v.STAZIONEPARTENZA
group by t.TIPO, s.CITTA












