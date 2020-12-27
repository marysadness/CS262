require 'date'


class PhoneBook
  attr_accessor :country, :birthday, :organization, :position

  def initialize(first_name, second_name, surname, number, params={})
    @first_name = first_name
    @second_name = second_name
    
    @surname = surname
    @number = number
    self.set_country(params.fetch(:country, nil))
    self.set_birthday(params.fetch(:birthday, nil))
    self.set_organization(params.fetch(:organization, nil))
    self.set_position(params.fetch(:position, nil))

    is_valid = self.validate()

    if is_valid
      db = DBFetcher.new()
      db.сonnect()
    else
      raise Exception.new "Неправильно введенные данные"
    end
  end

  def set_country(country)
    if Validator.new().validate_country(country)
      @country = country
    else
      puts 'Страны не существует'
    end
  end

  def set_birthday(birthday)
    if Validator.new().validate_birthday(birthday)
      @birthday = birthday

    else
      puts 'ВВедите правильный формат дня рождения'
    end
  end

  def set_organization(organization)
    if Validator.new().validate_organization(organization)
      @organization = organization
    else
      puts 'ВВедите название организации без цифр'
    end
  end

  def set_position(post)
    if Validator.new().validate_post(post)
      @post = post
    else
      puts 'ВВедите название должности без цифр'
    end
  end

  def validate
    validator = Validator.new()
    verdicts = []
    verdicts.append(validator.validate_name(@first_name))
    verdicts.append(validator.validate_name(@second_name))    
    verdicts.append(validator.validate_name(@surname))

    verdicts.append(validator.validate_telephone(@number))
    verdicts.append(validator.validate_country(@country))
    verdicts.append(validator.validate_birthday(@birthday))
    verdicts.append(validator.validate_organization(@organization))
    verdicts.append(validator.validate_post(@post))

    return !(verdicts.include? false)
  end
end


class Validator
  def validate_name(name)
    return name.count("0-9") == 0
  end

  def validate_telephone(number)
    Float(number) != nil rescue false
  end

  def validate_birthday(birthday)
    if (birthday.nil?) 
        return true
    end
    begin
        Date.parse(birthday)
        if (Date.parse(birthday) > Date.parse('31.12.1920'))
            return true
        else
            return false
        end
        rescue ArgumentError
            return false
        
    end
  end



  def validate_country(country)
    return country.nil? || Countries.include?(country)
  end

  def validate_organization(organization_name)

    return organization_name.nil? || organization_name.count("0-9") == 0
  end

  def validate_position(post_name)
    return post_name.nil? || post_name.count("0-9") == 0
  end
end


class Countries
  world = ['Russia', 'USA', 'England', 'Spain', 'Germany', 'Canada', 'Japan', 'Korea', 'Australia', 'China']

  def include?(country)

    return self.world.include? country
  end
end


class DBFetcher
  def сonnect()
    return 'Вы подключены к базе'
  end

  def fetch(sql_imitation)
    return true
  end
end


class DBHandle
  def convert(array)
    return array.join(';')
  end
end