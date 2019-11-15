set_grain_pillar:
  grains.present:
    - name: lab
    - value: {{pillar[grains['id']]}}
