# MyAnsible
Repositorio de ansible para uso online para produção e para homologação.

O Ansible utiliza uma estrutura de pastas flexível e organizada para gerenciar seus arquivos, tornando o trabalho mais eficiente e permitindo uma maior reutilização de código. Abaixo está a estrutura de pastas recomendada para projetos Ansible:

---

### **Estrutura Geral de um Projeto Ansible**
```plaintext
ansible_project/
├── ansible.cfg          # Arquivo de configuração do Ansible
├── inventory/           # Arquivo(s) ou diretório de inventário
│   ├── hosts            # Inventário padrão (nome pode variar)
│   └── group_vars/      # Variáveis específicas para grupos de hosts
├── playbooks/           # Playbooks Ansible
│   ├── site.yml         # Playbook principal
│   ├── webservers.yml   # Playbook de exemplo
│   └── tasks/           # Diretório opcional para organização de tarefas
├── roles/               # Diretório para roles
│   ├── common/          # Exemplo de role "common"
│   │   ├── defaults/    # Variáveis padrão
│   │   ├── files/       # Arquivos estáticos para transferência
│   │   ├── handlers/    # Arquivos de manipuladores (handlers)
│   │   ├── meta/        # Informações de dependências e metadados
│   │   ├── tasks/       # Lista de tarefas da role
│   │   ├── templates/   # Modelos (Jinja2) para renderização
│   │   └── vars/        # Variáveis específicas da role
├── group_vars/          # Variáveis específicas para grupos de hosts
│   └── all.yml          # Exemplo de variáveis para todos os hosts
├── host_vars/           # Variáveis específicas para hosts individuais
│   └── hostname.yml     # Exemplo de variáveis para um host específico
├── library/             # Módulos personalizados do Ansible
├── plugins/             # Plugins personalizados do Ansible
├── collections/         # Coleções de roles e módulos Ansible
└── vault/               # Diretório opcional para arquivos criptografados (Vault)
```

---

### **Descrição dos Componentes**

1. **`ansible.cfg`**:
   - Arquivo de configuração que personaliza o comportamento do Ansible, como o local do inventário, plugins, tempo limite, etc.

2. **`inventory/`**:
   - Contém o inventário que define os hosts e grupos de hosts gerenciados pelo Ansible.
   - Pode ser um único arquivo (ex.: `hosts`) ou um diretório contendo múltiplos arquivos de inventário.

3. **`playbooks/`**:
   - Armazena os **playbooks**, que descrevem as tarefas e como elas devem ser aplicadas aos hosts.

4. **`roles/`**:
   - Contém as **roles**, que são conjuntos reutilizáveis de tarefas, variáveis, templates e arquivos organizados de forma modular.

   - Estrutura típica de uma role:
     ```plaintext
     roles/
     └── role_name/
         ├── defaults/      # Variáveis padrão (menor prioridade)
         ├── files/         # Arquivos estáticos para copiar
         ├── handlers/      # Manipuladores chamados por tasks
         ├── meta/          # Metadados sobre a role (ex.: dependências)
         ├── tasks/         # Tarefas principais
         ├── templates/     # Modelos para renderização (Jinja2)
         └── vars/          # Variáveis específicas da role (maior prioridade)
     ```

5. **`group_vars/`**:
   - Contém variáveis específicas para grupos de hosts definidos no inventário.

6. **`host_vars/`**:
   - Contém variáveis específicas para hosts individuais definidos no inventário.

7. **`library/`**:
   - Contém módulos personalizados do Ansible.

8. **`plugins/`**:
   - Plugins personalizados, como callbacks, filters ou módulos extras.

9. **`collections/`**:
   - Diretório para coleções instaladas manualmente ou personalizadas.

10. **`vault/`** (opcional):
    - Armazena arquivos protegidos com o **Ansible Vault**.

---

### **Exemplo Básico de Uso**

- Criar um arquivo `inventory/hosts`:
  ```ini
  [webservers]
  server1 ansible_host=192.168.1.10 ansible_user=ubuntu

  [dbservers]
  server2 ansible_host=192.168.1.20 ansible_user=ubuntu
  ```

- Criar um playbook `playbooks/site.yml`:
  ```yaml
  - name: Configure web servers
    hosts: webservers
    roles:
      - common
      - webserver

  - name: Configure database servers
    hosts: dbservers
    roles:
      - common
      - database
  ```

- Criar a estrutura de roles no diretório `roles/`.

---

Essa estrutura ajuda a manter projetos organizados e escaláveis, especialmente para ambientes complexos.