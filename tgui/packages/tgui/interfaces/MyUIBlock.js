import { useBackend } from '../backend';
import { Button, LabeledList } from '../components';
import { Window } from '../layouts';

export const MyUIBlock = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window width={300} height={200} resizable>
      <Window.Content scrollable>
        <LabeledList>
          <LabeledList.Item label="Power">
            <Button
              icon={data.active ? 'power-off' : 'times'}
              onClick={() => act('toggle_power')}
              disabled={!data.ready_to_boot}
            >
              {data.active ? 'On' : 'Off'}
            </Button>
          </LabeledList.Item>
        </LabeledList>
      </Window.Content>
    </Window>
  );
};
