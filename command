using System;

// Step 1: Command Interface
public interface ICommand
{
    void Execute();
    void Undo();
}

// Step 2: Receiver Class
public class Light
{
    public void TurnOn()
    {
        Console.WriteLine("The light is ON");
    }

    public void TurnOff()
    {
        Console.WriteLine("The light is OFF");
    }
}

// Step 3: Concrete Commands
public class TurnOnCommand : ICommand
{
    private Light _light;

    public TurnOnCommand(Light light)
    {
        _light = light;
    }

    public void Execute()
    {
        _light.TurnOn();
    }

    public void Undo()
    {
        _light.TurnOff();
    }
}

public class TurnOffCommand : ICommand
{
    private Light _light;

    public TurnOffCommand(Light light)
    {
        _light = light;
    }

    public void Execute()
    {
        _light.TurnOff();
    }

    public void Undo()
    {
        _light.TurnOn();
    }
}

// Step 4: Invoker Class
public class RemoteControl
{
    private ICommand _command;

    public void SetCommand(ICommand command)
    {
        _command = command;
    }

    public void PressButton()
    {
        _command.Execute();
    }

    public void PressUndo()
    {
        _command.Undo();
    }
}

// Step 5: Main Program
class Program
{
    static void Main()
    {
        Light light = new Light();
        ICommand turnOn = new TurnOnCommand(light);
        ICommand turnOff = new TurnOffCommand(light);

        RemoteControl remote = new RemoteControl();

        // Turning light ON
        remote.SetCommand(turnOn);
        remote.PressButton();
        remote.PressUndo();

        Console.WriteLine();

        // Turning light OFF
        remote.SetCommand(turnOff);
        remote.PressButton();
        remote.PressUndo();
    }
}
