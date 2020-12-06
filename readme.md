# Generate Badges for GitLab CIs

Is a bash script that update your badges on project with status from pipelines
![image](https://user-images.githubusercontent.com/19173171/101295911-c619e380-37f6-11eb-87bd-caed7417b586.png)
## How to use

- Create one Personal Access Token on GitLab [here](https://gitlab.com/-/profile/.personal_access_tokens).

- Add your badges to your repository in Settings/General/badges

- Use [GitLab API](https://docs.gitlab.com/ee/api/project_badges.html) to greb badge´s ids 

    ```curl
    curl --request GET 'https://gitlab.com/api/v4/projects/:id/badges'
    --header 'PRIVATE-TOKEN: <personal-access-token>'
    ```
- Arguments:
    
    a. Environment, Label (production, staging, develop)

    b. Status (running, passed, failed)

    c. Badge id

    d. Personal Access Token

    e. Project ID

## Usage

Copy script inside your project

In your .yml for GitLab CI add informations to run script.

You can use environment variables for ids, tokens inside CI/CD configuration!

```yml
before_script: 
    - chmod +x ./update_badge.sh
after_script:
  - bash ./update_badge.sh $(cat branch) $(cat status) $(cat badge) $API_TOKEN $PROJECT_ID

script: 
    - bash ./update_badge.sh develop running $DEVELOP_BADGE $API_TOKEN $PROJECT_ID
    - echo $DEVELOP_BADGE > badge
    - echo develop > branch
    - echo failed > status
    ...
    - echo passed > status
```

## Contributing
Pull requests are welcome! :smiley: 
