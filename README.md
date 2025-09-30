## Análise de Mapa Raman

### Visão Geral
Este código em MATLAB/Octave realiza análise de imagens de mapas Raman para calcular a razão ID/IG, uma métrica importante na caracterização de materiais carbonáceos como grafite e grafeno.

---

### Objetivo

- Processar imagens de espectroscopia Raman para:

- Isolar picos D e G característicos

- Calcular intensidades dos picos

- Determinar a razão ID/IG

- Visualizar resultados através de mapas de calor

---

### Contexto Científico

- Picos Raman em Materiais Carbonáceos:
- Pico G (~1580 cm⁻¹): Vibrações na rede cristalina do grafite
- Pico D (~1350 cm⁻¹): Defeitos e desordem na estrutura
- Razão ID/IG: Indicador de qualidade cristalina e densidade de defeitos

---

### Requisitos e Dependências

- Software: ```MATLAB``` ou ```GNU Octave```
- Pacote image do Octave (para usuários do Octave)

---

### Instalação de Dependências

```bash
% No Octave:
pkg install -forge image
pkg load image
```

---

### Arquivo de Entrada:
```exemples/mapa_raman.png```: Imagem do mapa Raman em formato PNG

### Saídas do Programa

#### 1. Figuras Geradas

- Figura 1: Imagem original do mapa Raman
- Figura 2: Imagem binarizada (segmentação)
- Figura 3: Mapa de calor com métricas sobrepostas

---

### Saída no Console

***Intensidade Pico D:*** [valor]
***Intensidade Pico G:*** [valor]
***Razão ID/IG:*** [valor]

### Métricas Calculadas

| Métrica       | Descrição                   | Interpretação                        |
|---------------|-----------------------------|--------------------------------------|
| intensidade_d | Intensidade média do pico D | Proporcional à densidade de defeitos |
| intensidade_g | Intensidade média do pico G | Proporcional à qualidade cristalina  |
| razao_id_ig   | Razão entre intensidades    | Indicador de desordem estrutural     |

---

### Parâmetros Ajustáveis

#### Threshold de Binarização

```matlab
% Método automático (atual)
threshold = graythresh(mapa_raman);

% Para ajuste manual (se necessário):
threshold = 0.5; % Valor entre 0 e 1
```

---

### Posição do Texto no Mapa de Calor

```matlab
text(10, 10, [...]);  % Coordenadas (x,y) podem ser ajustadas
```