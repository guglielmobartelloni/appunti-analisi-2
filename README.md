# appunti-analisi-2

Appunti del corso di Analisi Matematica 2. Il progetto contiene sia i sorgenti LaTeX sia i PDF generati e viene distribuito con licenza [GPL-3.0](LICENSE).

## Contenuti

- `appunti-analisi.pdf`: raccolta completa degli appunti.
- `lezioni/`: sorgenti delle singole lezioni.
- `figures/` e `images/`: figure utilizzate nel documento.
- `merged/`: versioni unite degli appunti, incluse raccolte separate di definizioni e teoremi.
- `template/`: preambolo e template LaTeX condivisi.
- `parser-splitter.lua`: script di supporto per la gestione dei sorgenti.

## Compilazione

È necessaria una distribuzione LaTeX completa, ad esempio TeX Live o MiKTeX, con i pacchetti importati da `template/preamble.tex`.

Dalla directory principale del repository è possibile compilare il documento completo con:

```sh
pdflatex appunti-analisi.tex
pdflatex appunti-analisi.tex
```

La seconda compilazione aggiorna i riferimenti e l'indice dei contenuti. In alternativa si può usare `latexmk`:

```sh
latexmk -pdf appunti-analisi.tex
```

I file ausiliari prodotti dalla compilazione sono esclusi dal versionamento tramite `.gitignore`.

## Macro personalizzate

Le macro attive del progetto sono definite in [`template/preamble.tex`](template/preamble.tex). Le principali sono:

| Macro | Parametri | Descrizione |
| --- | --- | --- |
| `\Eval{espressione}{a}{b}` | 3 | Valuta un'espressione agli estremi `a` e `b`. |
| `\teorema{titolo}{contenuto}` | 2 | Inserisce un teorema evidenziato. |
| `\cor{titolo}{contenuto}` | 2 | Inserisce un corollario evidenziato. |
| `\proposizione{titolo}{contenuto}` | 2 | Inserisce una proposizione evidenziata. |
| `\defn{titolo}{contenuto}` | 2 | Inserisce una definizione evidenziata. |
| `\esempio{titolo}{contenuto}` | 2 | Inserisce un esempio evidenziato. |
| `\incfig[scala]{nome}` | 1 opzionale + 1 | Include la figura `nome.pdf_tex` dalla directory `figures/`; la scala predefinita è `1`. |
| `\DrawBlock{faccia}{indice}{altezza}` | 3 | Macro interna per alcuni disegni TikZ tridimensionali. |

Esempio di utilizzo:

```tex
\defn{Nome della definizione}{
  Testo della definizione.
}

\Eval{f(x)}{a}{b}

\incfig[0.8]{curva-di-livello-2}
```

Il sorgente usa direttamente comandi standard come `\mathbb{R}`, `\mathbb{N}`, `\mathbb{C}` e `\mathbb{Z}`: gli alias `\R`, `\N`, `\C` e `\Z` non sono attualmente definiti nel progetto.

> Nota: la macro `\lemma` è dichiarata nel preambolo, ma la sua implementazione richiama l'ambiente `lem`, mentre l'ambiente dichiarato è `lemm`. Non viene utilizzata negli appunti attuali e va verificata prima dell'uso.

## Aggiungere una lezione

1. Creare il file `lezioni/lezione-N.tex` seguendo la struttura degli altri sorgenti.
2. Inserire nel file principale `appunti-analisi.tex` la riga `\subfile{lezioni/lezione-N}`.
3. Compilare il documento dalla directory principale per verificare riferimenti e figure.

## Licenza

Il progetto è distribuito con licenza [GNU General Public License v3.0](LICENSE).
