# 🚗 Ninja Garage

A marketplace where you can rent unique looking cars from the Japanese categories of "Itasha", "Bosozoku Bike", and "Decotora".

<p float="left">
  <img src="https://user-images.githubusercontent.com/69304255/172329064-09f359a2-9a5c-4020-9bf8-4fd9b03b3df0.png" width="400" />
  <img src="https://user-images.githubusercontent.com/69304255/172329091-1d392336-66d0-4963-810d-ab8fe61a2f15.png" width="400" /> 
  <img src="https://user-images.githubusercontent.com/69304255/172329101-2b081059-4df0-4b23-8b3b-e18ae92a78e6.png" width="400" />
  <img src="https://user-images.githubusercontent.com/69304255/172329103-40e75239-2628-4f0e-8856-734fabddd88d.png" width="400" />
  <img src="https://user-images.githubusercontent.com/69304255/172329104-3c69b145-9e08-4d02-b7f7-3571ba76d630.png" width="400" />
  <img src="https://user-images.githubusercontent.com/69304255/172329108-347dbe56-e95c-4639-bd2c-bfba5436a0cc.png" width="400" />
</p>

<br>
App home: https://ninja-garage.herokuapp.com/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping


## Team Members
- [Tirso Pascual](https://www.github.com/tirsop)
- [Luis Rodriguez](https://www.github.com/luisrrv)
- [Yuki Harwood](https://www.github.com/yharwood)
- [Kenji Yanagawa](https://www.github.com/KenjiYANAGAWA)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
