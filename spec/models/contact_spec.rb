require 'spec_helper'

describe Contact do

  it { should validate_presence_of :email }
  it { should validate_presence_of(:first_name).with_message('Please enter your first name.') }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :description }


  it { should have_valid(:email).when('graham.jackson07@gmail.com')}
  it { should_not have_valid(:email).when(nil,'','12345','abcdef@com')}

  it { should have_valid(:first_name).when('Graham','Jennifer','Matt')}
  it { should_not have_valid(:first_name).when(nil,'')}

  it { should have_valid(:last_name).when('Jackson','Caulk','Caruso')}
  it { should_not have_valid(:last_name).when(nil,'')}

  it { should have_valid(:subject).when('Location of store','Services that you offer','How much does this service cost exactly?')}
  it { should_not have_valid(:subject).when(nil,'')}

  it { should have_valid(:description).when(
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque 
     ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
    voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
     Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi 
     tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem 
     ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea 
     voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
    dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non 
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')}
  it { should_not have_valid(:description).when(nil,'')}


end
