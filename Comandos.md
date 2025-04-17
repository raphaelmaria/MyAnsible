# Comandos Uteis

O **`ansible-galaxy`** é uma ferramenta do Ansible para gerenciar **roles** e **coleções** (collections) da comunidade ou criadas internamente. Ele permite baixar, instalar, criar, remover e compartilhar componentes reutilizáveis.

Aqui estão os comandos mais úteis do **`ansible-galaxy`**, organizados por funcionalidade:

---

### **1. Gerenciamento de Roles**

#### **Instalar uma Role**
ansible-galaxy install <role_name>

- Exemplo:
  ansible-galaxy install geerlingguy.apache

#### **Instalar Roles a partir de um arquivo `requirements.yml`**
ansible-galaxy install -r requirements.yml
- Exemplo de `requirements.yml`:
  ```yaml
  roles:
    - name: geerlingguy.apache
    - name: geerlingguy.mysql
  ```
- Comando:
  ansible-galaxy install -r requirements.yml

#### **Criar uma Role**
ansible-galaxy init <role_name>

- Exemplo:
  ansible-galaxy init my_custom_role
  - Isso cria a estrutura padrão de uma role no diretório atual.

#### **Listar Roles Instaladas**
ansible-galaxy list

#### **Remover uma Role**
ansible-galaxy remove <role_name>
- Exemplo:
  ansible-galaxy remove geerlingguy.apache

#### **Atualizar uma Role**
ansible-galaxy install <role_name> --force
- Exemplo:
  ansible-galaxy install geerlingguy.apache --force

---

### **2. Gerenciamento de Coleções**

#### **Instalar uma Coleção**
ansible-galaxy collection install <namespace.collection_name>
- Exemplo:
  ansible-galaxy collection install community.mysql

#### **Instalar Coleções de um Arquivo `requirements.yml`**
ansible-galaxy collection install -r requirements.yml
- Exemplo de `requirements.yml`:
  ```yaml
  collections:
    - name: community.mysql
    - name: ansible.windows
- Comando:
  ansible-galaxy collection install -r requirements.yml

#### **Listar Coleções Instaladas**
ansible-galaxy collection list

#### **Remover uma Coleção**
ansible-galaxy collection remove <namespace.collection_name>
- Exemplo:
  ansible-galaxy collection remove community.mysql

---

### **3. Informações e Diagnósticos**

#### **Mostrar Informações sobre uma Role**
ansible-galaxy role info <role_name>
- Exemplo:
  ansible-galaxy role info geerlingguy.apache

#### **Mostrar Informações sobre uma Coleção**
ansible-galaxy collection info <namespace.collection_name>
- Exemplo:
  ansible-galaxy collection info community.mysql

---

### **4. Publicação e Compartilhamento**

#### **Publicar uma Role no Ansible Galaxy**
- Faça login no [Ansible Galaxy](https://galaxy.ansible.com) com sua conta.
- Certifique-se de que o **`meta/main.yml`** está configurado corretamente na role.
- Faça upload para um repositório GitHub público.
- O Ansible Galaxy importará automaticamente sua role do repositório GitHub conectado.

#### **Publicar uma Coleção no Ansible Galaxy**
1. Prepare a estrutura da coleção:
   ansible-galaxy collection init <namespace.collection_name>

2. Empacote a coleção:
   ansible-galaxy collection build

3. Envie para o Ansible Galaxy:
   ansible-galaxy collection publish <arquivo_tar.gz>

---

### **5. Atualizar Roles e Coleções**

#### **Atualizar Todas as Roles de um Arquivo `requirements.yml`**
ansible-galaxy install -r requirements.yml --force

#### **Atualizar Todas as Coleções de um Arquivo `requirements.yml`**
ansible-galaxy collection install -r requirements.yml --force

---

### **6. Comandos Gerais de Ajuda**

- Exibir ajuda geral:
  ansible-galaxy --help

- Exibir ajuda para um subcomando específico:
  ansible-galaxy <subcommand> --help
  - Exemplo:
    ansible-galaxy install --help

---

Esses comandos ajudam a gerenciar de forma eficiente roles e coleções no Ansible, promovendo a reutilização e a organização do seu código de automação.