# PriestCompanion: Instance Journal e custom maps

Referência técnica consolidada do chat anterior. Esta nota deve ser lida antes de
alterar a navegação de dungeons, raids ou NPCs internos.

## Descoberta principal

O Instance Journal não usa um único identificador para uma instance. Existem
duas camadas que precisam permanecer separadas:

| Camada | Uso | Exemplo BFD |
| --- | --- | --- |
| `AreaID` / `ZoneOrSort` | Chave do catálogo e vínculo dos dados do addon (`source.instanceID`, `quest.instanceID`, `npc.map.instanceID`) | `719` |
| índice nativo do WorldMap | Argumentos de `SetMapZoom(continent, zone)` | `mapID = 7`, `zoneID = 1` |

Assim, `719` não deve ser passado diretamente para `SetMapZoom`. Para
Blackfathom Deeps, a chamada confirmada é `SetMapZoom(7, 1)`. O mesmo princípio
deve ser aplicado a qualquer outra instance: o ID do catálogo identifica o
conteúdo; o par `worldMap.mapID/worldMap.zoneID` identifica o mapa que o cliente
consegue abrir.

O Instance Journal também expõe um identificador lógico de mapa interno, como
`MapContinentId = BlackfathomDeeps`. Esse nome é útil para relacionar o NPC ao
mapa da dungeon, mas não substitui o par numérico aceito por `SetMapZoom`.

## Exemplo validado: Blackfathom Deeps

- Catálogo: `PC.Data.Instances[719]`.
- Mapa nativo: `worldMap = { mapID = 7, zoneID = 1 }`.
- NPC: Argent Guard Thaelrid (`NPC 4787`).
- Coordenadas internas confirmadas: `13.3, 51.2`.
- Entrada externa usada somente como fallback: Ashenvale `13.9, 14.3`.
- As coordenadas do NPC são percentuais do mapa e são convertidas diretamente
  para pixels de `WorldMapButton` pelo marcador do addon.

## Custom maps e dependências opcionais

No ecossistema Turtle/Vanilla, `C_Map.GetMapAreaIDs()` e `C_Map.GetMapInfo()`
podem indexar cidades, instances e custom zones. O pfQuest-Turtle também possui
suporte a custom dungeon maps. Isso serve como fonte de resolução em runtime,
mas não deve transformar um ID externo em um pin nativo sem coordenadas
verificadas.

O PriestCompanion continua standalone: não depende de ClassicAPI, pfQuest ou do
Instance Journal para renderizar o caso nativo já conhecido. ClassicAPI pode
fornecer metadados, mas não garante que a arte ou o índice do mapa esteja
disponível no cliente. pfQuest permanece apenas como fallback opcional para
NPCs/objetos que não têm coordenadas nativas publicadas.

## Regras de implementação

1. Manter `PC.Data.Instances` como catálogo central. A chave é o
   `AreaID/ZoneOrSort` usado pelos dados de aquisição.
2. Guardar índices nativos/custom conhecidos no registro da instance, em
   `worldMap = { mapID = ..., zoneID = ... }`; não espalhar esses números em
   `Core/Map.lua`.
3. Resolver mapas de instance antes de tentar `GetMapContinents()`/
   `GetMapZones()`, pois mapas internos podem não aparecer nessa enumeração.
4. Usar coordenadas nativas quando existirem. Se não existirem, abrir a entrada
   da dungeon ou a zona externa, deixando claro que é fallback e sem desenhar um
   pin de boss inventado.
5. Para um novo custom map, registrar a origem do ID e validar no cliente antes
   de adicioná-lo. Não assumir que um `MapID` de `C_Map`, pfQuest ou outro addon é
   o mesmo índice de `SetMapZoom`.
6. Não substituir a navegação nativa por uma dependência obrigatória de pfQuest.

## Arquivos relacionados

- `Data/Instances.lua`: metadados manuais de instances e índices WorldMap
  confirmados.
- `Data/InstanceJournalMaps.lua`: overlay dos índices Instance Journal e das
  coordenadas internas de bosses verificadas; fica depois dos arquivos
  gerados para não ser sobrescrito por uma nova sincronização do catálogo.
- `Core/Map.lua`: resolução de instance, zonas, marcadores e fallbacks.
- `Data/NPCs.lua`: referências centralizadas de NPCs e coordenadas.
- `Data/Quests.lua` / `Data/QuestChains.lua`: vínculos de quests e chains.
- `tools/octowow/README.md`: procedência do snapshot de aquisição e regra de
  não fabricar coordenadas.

## Limitações conhecidas

Os índices nativos do Instance Journal foram transcritos para as instances
presentes no catálogo. Para bosses que ainda não têm coordenadas publicadas
(por exemplo, alguns bosses de Scholomance, Zul'Farrak e AQ40), o botão abre o
mapa interno correto da instance, sem desenhar um pin inventado; se o cliente
não expuser esse mapa, o fluxo continua usando a entrada externa como fallback.
